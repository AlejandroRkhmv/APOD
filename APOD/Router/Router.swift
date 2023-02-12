//
//  Router.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import UIKit
import CoreData

class Router: IRouter {
    
    let builder: IBuilder?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController, builder: IBuilder) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func initViewController() {
        if let navigationController = navigationController {
            guard let startVC = builder?.buildStartViewController(router: self) else { return }
            navigationController.viewControllers = [startVC]
        }
    }
    
    func pushApodViewController(object: ApodElement, context: NSManagedObjectContext!) {
        if let navigationController = navigationController {
            guard let apodVC = builder?.buildApodViewController(object: object, router: self, context: context) else { return }
            navigationController.pushViewController(apodVC, animated: false)
        }
    }
    
    func pushDescriptionViewController(object: ApodElement) {
        if let navigationController = navigationController {
            guard let text = object.explanation else { return }
            guard let descriptionViewController = builder?.buildDescriptionViewController(text: text, router: self) else { return }
            navigationController.pushViewController(descriptionViewController, animated: false)
        }
    }
    
    func pushMyApodsTableViewController(context: NSManagedObjectContext!) {
        if let navigationController = navigationController {
            guard let myApodsViewController = builder?.buildMyApodsTableViewController(router: self, context: context) else { return }
            navigationController.pushViewController(myApodsViewController, animated: false)
        }
    }
    
    func popViewController() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: false)
        }
    }
}
