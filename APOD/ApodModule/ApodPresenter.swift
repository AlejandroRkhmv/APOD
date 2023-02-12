//
//  ApodPresenter.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation
import CoreData
import UIKit

class ApodPresenter: IApodPresenter {

    weak var apodViewController: IApodViewController?
    var apodInteractor: IApodInteractor?
    var router: IRouter?
    var context: NSManagedObjectContext!
    var apod: ApodElement?
    
    
    required init(apodViewController: IApodViewController?, apodInteractor: IApodInteractor?, router: IRouter?, apod: ApodElement?, context: NSManagedObjectContext!) {
        self.apodViewController = apodViewController
        self.apodInteractor = apodInteractor
        self.router = router
        self.apod = apod
        self.context = context
    }
    
    func needSomeData() {
        if apod is Apod {
            needApodImage(apod as! Apod)
        }
        if apod is MyAPOD {
            needApodImage(apod as! MyAPOD)
        }
    }
    
    internal func needApodImage(_ apod: Apod) {
        
        if let image = apodInteractor?.cache.object(forKey: apod.date as AnyObject) {
            guard let data = image.pngData(), let title = apod.title else { return }
            DispatchQueue.main.async {
                self.apodViewController?.setUI(from: data, text: title)
            }
        } else {
            if apod.mediaType == "image" {
                self.apodViewController?.apodView?.activityIndicator.startAnimating()
                guard let urlString = apod.hdurl else { return }
                apodInteractor?.getDataImage(urlString: urlString, completionHandler: { [weak self] data in
                    guard let self = self else { return }
                    guard let title = apod.title else { return }
                    DispatchQueue.main.async {
                        self.apodViewController?.setUI(from: data, text: title)
                    }
                    guard let newApod = self.apod as? Apod else { return }
                    let fetchRequest: NSFetchRequest<MyAPOD> = MyAPOD.fetchRequest()
                    if let apods = try? self.context.fetch(fetchRequest) {
                        for apod in apods {
                            if apod.date == newApod.date {
                                return
                            }
                        }
                    }
                    self.saveAPODinCoreData(object: newApod, data: data)
                    if let image = UIImage(data: data), let date = newApod.date {
                        self.apodInteractor?.saveToCache(image: image, date: date)
                    }
                })
            } else {
                print("video")
                guard let urlForVideo = apodInteractor?.constant.videoImage else { return }
                apodInteractor?.getDataImage(urlString: urlForVideo, completionHandler: { [weak self] data in
                    guard let self = self else { return }
                    guard let title = apod.title else { return }
                    DispatchQueue.main.async {
                        self.apodViewController?.setUI(from: data, text: title)
                    }
                    guard let newApod = self.apod else { return }
                    self.saveAPODinCoreData(object: newApod as! Apod, data: data)
                })
            }
        }
    }
    
    internal func needApodImage(_ apod: MyAPOD) {
        guard let data = apod.image?.pngData(), let title = apod.title else { return }
        DispatchQueue.main.async {
            self.apodViewController?.setUI(from: data, text: title)
        }
    }
    
    private func saveAPODinCoreData(object: Apod, data: Data) {
        guard let context = context else { return }
        let apod = MyAPOD(context: context)
        apod.title = object.title
        apod.date = object.date
        apod.explanation = object.explanation
        apod.image = UIImage(data: data)
             
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        print(apod)
    }
    
    func InfoButtonTapped() {
        guard let apod = self.apod else { return }
        self.router?.pushDescriptionViewController(object: apod)
    }
}
