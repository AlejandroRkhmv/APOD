//
//  IRouter.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import UIKit
import CoreData

protocol IStartRouterInit {
    
    func initViewController()
}

protocol IStartRouterPush {
    
    func pushApodViewController(object: ApodElement, context: NSManagedObjectContext!)
    func pushDescriptionViewController(object: ApodElement)
    func pushMyApodsTableViewController(context: NSManagedObjectContext!)
    func popViewController()
}

typealias IRouter = IStartRouterInit & IStartRouterPush
