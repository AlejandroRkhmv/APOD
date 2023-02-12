//
//  ApodViewController.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import UIKit

class ApodViewController: UIViewController {

    var apodView: ApodView?
    var apodPresenter: IApodPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customBuckButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initApodUIElements()
        apodPresenter.needSomeData()
        apodView?.delegate = self
    }
}
