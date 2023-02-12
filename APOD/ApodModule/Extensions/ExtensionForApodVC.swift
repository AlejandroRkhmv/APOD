//
//  ExtensionForApodVC.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import UIKit

extension ApodViewController {
    
    func initApodUIElements() {
        
        addApodView()
        setApodViewConstraints()
    }
    
    func addApodView() {
        apodView = ApodView()
        apodView?.translatesAutoresizingMaskIntoConstraints = false
        guard let apodView = apodView else { return }
        view.addSubview(apodView)
    }
    
    func setApodViewConstraints() {
        apodView?.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
        apodView?.heightAnchor.constraint(equalToConstant: view.bounds.size.height).isActive = true
        apodView?.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        apodView?.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
    
    func customBuckButton() {
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Go back", style: .plain, target: self, action: #selector(pop))
        newBackButton.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    @objc
    func pop() {
        apodPresenter.router?.popViewController()
    }
}

extension ApodViewController: IApodViewController {
    
    func setUI(from data: Data, text: String) {
        apodView?.apodImage.image = UIImage(data: data)
        apodView?.activityIndicator.stopAnimating()
        apodView?.titleLabel.text = text
    }
}

extension ApodViewController: ApodViewDelegate {
    
    func infoButtonTapped() {
        apodPresenter.InfoButtonTapped()
    }
    
    
}
