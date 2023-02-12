//
//  DescriptionViewController.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import UIKit

class DescriptionViewController: UIViewController {

    var descriptionView: DescriptionView?
    var descriptionPresenter: IDescriptionPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customBackButton()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initDescriptionView()
        descriptionPresenter?.descriptionViewControllerDidAppear()
    }
}
