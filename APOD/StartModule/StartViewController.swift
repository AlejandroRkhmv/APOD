//
//  ViewController.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import UIKit

class StartViewController: UIViewController {
    
    var startView: StartView?
    var startPresenter: IStartPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startPresenter?.needDataForBackgroundImageForStartVC()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initStartUIElements()
        userEnterDateAndPressOK()
        startView?.delegate = self
    }
}

