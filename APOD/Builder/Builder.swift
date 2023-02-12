//
//  Builder.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import UIKit
import CoreData

class Builder: IBuilder {
    
    func buildStartViewController(router: IRouter) -> UIViewController {
        let startViewController = StartViewController()
        let networkService = NetworkService()
        let startInteractor = StartInteractor(networkService: networkService)
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext else { return startViewController }
        let startPresenter = StartPresenter(startViewController: startViewController, startInteractor: startInteractor, router: router, context: context)
        startViewController.startPresenter = startPresenter
        return startViewController
    }
    
    func buildApodViewController(object: ApodElement, router: IRouter, context: NSManagedObjectContext!) -> UIViewController {
        let apodViewController = ApodViewController()
        let networkService = NetworkService()
        let apodInteractor = ApodInteractor(networkService: networkService)
        let apodPresenter = ApodPresenter(apodViewController: apodViewController, apodInteractor: apodInteractor, router: router, apod: object, context: context)
        apodViewController.apodPresenter = apodPresenter
        return apodViewController
    }
    
    func buildDescriptionViewController(text: String, router: IRouter) -> UIViewController {
        let descriptionViewController = DescriptionViewController()
        let descriptionPresenter = DescriptionPresenter(descriptionViewController: descriptionViewController, router: router, text: text)
        descriptionViewController.descriptionPresenter = descriptionPresenter
        return descriptionViewController
    }
    
    func buildMyApodsTableViewController(router: IRouter, context: NSManagedObjectContext!) -> UIViewController {
        let myApodsViewController = MyApodsViewController()
        let myApodsPresenter = MyApodsPresenter(myApodViewController: myApodsViewController, context: context, router: router)
        myApodsViewController.myApodPresenter = myApodsPresenter
        return myApodsViewController
    }
}
