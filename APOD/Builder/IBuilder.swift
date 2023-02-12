//
//  IBuilder.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import UIKit
import CoreData

protocol IBuilder {
    
    func buildStartViewController(router: IRouter) -> UIViewController
    func buildApodViewController(object: ApodElement, router: IRouter, context: NSManagedObjectContext!) -> UIViewController
    func buildDescriptionViewController(text: String, router: IRouter) -> UIViewController
    func buildMyApodsTableViewController(router: IRouter, context: NSManagedObjectContext!) -> UIViewController
}
