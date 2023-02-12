//
//  ApodRouter.swift
//  APODs
//
//  Created by Александр Рахимов on 10.02.2023.
//

import UIKit

class ApodRouter: IApodRouter {
    
    let builder: IBuilder?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController, builder: IBuilder) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func pushViewController(object: Apod) {
        if let navigationController = navigationController {
            guard let text = object.explanation else { return }
            guard let descriptionViewController = builder?.buildDescriptionViewController(text: text, router: self) else { return }
            navigationController.pushViewController(descriptionViewController, animated: false)
        }
    }
    
    func popViewController() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: false)
        }
    }
}
