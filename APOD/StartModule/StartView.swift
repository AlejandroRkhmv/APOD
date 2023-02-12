//
//  ViewElements.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import UIKit

class StartView: UIView {
    
    var delegate: StartViewControllerDelegate?
    let getApodButton = UIButton()
    let myApodsButton = UIButton()
    let backgroundImage = UIImageView()
    var messege = ""
    var completion: ((String?) -> Void)?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setAllUIElementsONStartVC()
        addActionToGetApodButton()
        addActionToMyApodsButton()
    }
    
    private func setAllUIElementsONStartVC() {
        createBackgroundImage()
        setConstraintsForBackgroundImage()
        createGetApodButton()
        setConstraintsGetApodButton()
        createMyApodsButton()
        setConstraintsMyApodsButton()
    }
    
    private func addActionToGetApodButton() {
        getApodButton.addTarget(self, action: #selector(getApodButtonTapped), for: .touchUpInside)
    }
    
    private func addActionToMyApodsButton() {
        myApodsButton.addTarget(self, action: #selector(myApodButtonTapped), for: .touchUpInside)
    }
}
