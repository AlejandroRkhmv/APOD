//
//  IApodPresenter.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation
import CoreData

protocol IApodPresenter: AnyObject {
    
    var apodViewController: IApodViewController? { get set }
    var apodInteractor: IApodInteractor? { get set }
    var router: IRouter? { get set }
    var context: NSManagedObjectContext! { get set }
    var apod: ApodElement? { get set }
    
    init(apodViewController: IApodViewController?, apodInteractor: IApodInteractor?, router: IRouter?, apod: ApodElement?, context: NSManagedObjectContext!)
    
    func needSomeData()
    
    func InfoButtonTapped()
}
