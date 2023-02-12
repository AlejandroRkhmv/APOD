//
//  StartPresenter.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation
import CoreData


class StartPresenter: IStartPresenter {
    
    weak var startViewController: IStartViewController?
    var startInteractor: IStartInteractor?
    var router: IRouter?
    var context: NSManagedObjectContext!
    var apod: Apod?
    
    required init(startViewController: IStartViewController?, startInteractor: IStartInteractor?, router: IRouter?, context: NSManagedObjectContext!) {
        self.startViewController = startViewController
        self.startInteractor = startInteractor
        self.router = router
        self.context = context
    }
    
    func needDataForBackgroundImageForStartVC() {
        startInteractor?.getDataForImage(completionHandler: { [weak self] data in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.startViewController?.setBackgroundImageToStartView(from: data)
            }
        })
    }
    
    func userTappedOKButton(date: String) {
        startInteractor?.needData(for: date, completionHandler: { [weak self] element in
            guard let self = self else { return }
            self.apod = element
            guard let apod = self.apod else { return }
            DispatchQueue.main.async {
                self.router?.pushApodViewController(object: apod, context: self.context)
            }
        })
    }
    
    func myApodsButtonTapped() {
        router?.pushMyApodsTableViewController(context: context)
    }
}
