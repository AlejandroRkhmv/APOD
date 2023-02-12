//
//  IMyApodsPresenter.swift
//  APOD
//
//  Created by Александр Рахимов on 10.02.2023.
//

import Foundation
import CoreData

protocol IMyApodPresenter: AnyObject {
    
    var myApodViewController: IMyApodsViewController! { get set }
    var context: NSManagedObjectContext! { get set }
    var router: IRouter? { get set }
    
    init(myApodViewController: IMyApodsViewController!, context: NSManagedObjectContext!, router: IRouter)
    
    func myApodsTableDidAppear()
}
