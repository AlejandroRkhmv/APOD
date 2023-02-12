//
//  MyApodsViewController.swift
//  APOD
//
//  Created by Александр Рахимов on 10.02.2023.
//

import UIKit
import CoreData

class MyApodsViewController: UIViewController {

    var table: MyApodsView?
    var fetchResultController: NSFetchedResultsController<MyAPOD>!
    var myApodPresenter: IMyApodPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customBackButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initializationFC()
        createDeleteButton()
        createTable()
        myApodPresenter.myApodsTableDidAppear()
    }
}
