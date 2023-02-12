//
//  MyApodsPresenter.swift
//  APOD
//
//  Created by Александр Рахимов on 10.02.2023.
//

import Foundation
import CoreData

class MyApodsPresenter: IMyApodPresenter {
    
    weak var myApodViewController: IMyApodsViewController!
    var context: NSManagedObjectContext!
    var router: IRouter?
    
    required init(myApodViewController: IMyApodsViewController!, context: NSManagedObjectContext!, router: IRouter) {
        self.myApodViewController = myApodViewController
        self.context = context
        self.router = router
    }
    
    func myApodsTableDidAppear() {
        myApodViewController.reloadMyApodsTable()
    }
}
