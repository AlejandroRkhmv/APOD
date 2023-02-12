//
//  IStartPresenter.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation
import CoreData

protocol IStartPresenter: AnyObject {
    
    var startViewController: IStartViewController? { get set }
    var startInteractor: IStartInteractor? { get set }
    var router: IRouter? { get set }
    var context: NSManagedObjectContext! { get set }
    var apod: Apod? { get set }
    
    init(startViewController: IStartViewController?, startInteractor: IStartInteractor?, router: IRouter?, context: NSManagedObjectContext!)
    
    func needDataForBackgroundImageForStartVC()
    func userTappedOKButton(date: String)
    func myApodsButtonTapped()
}
