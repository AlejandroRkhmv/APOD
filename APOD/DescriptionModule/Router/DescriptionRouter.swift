//
//  DescriptionRouter.swift
//  APODs
//
//  Created by Александр Рахимов on 10.02.2023.
//

import UIKit

class DescriptionRouter: IDescriptionRouter {
    
    let builder: IBuilder?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController, builder: IBuilder) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func popViewController() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: false)
        }
    }
}
