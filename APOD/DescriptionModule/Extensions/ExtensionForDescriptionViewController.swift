//
//  ExtensionForDescriptionViewController.swift
//  APODs
//
//  Created by Александр Рахимов on 10.02.2023.
//

import UIKit

extension DescriptionViewController {
    
    func initDescriptionView() {
        addDescriptionViewToViewController()
        setDescriptionViewConstraints()
    }
    
    func addDescriptionViewToViewController() {
        descriptionView = DescriptionView()
        descriptionView?.translatesAutoresizingMaskIntoConstraints = false
        guard let descriptionView = descriptionView else { return }
        view.addSubview(descriptionView)
    }
    
    func setDescriptionViewConstraints() {
        descriptionView?.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
        descriptionView?.heightAnchor.constraint(equalToConstant: view.bounds.size.height).isActive = true
        descriptionView?.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        descriptionView?.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
}

extension DescriptionViewController: IDescriptionViewController {
    func setText(text: String) {
        descriptionView?.descriptionLabel.text = text
    }
    
    func customBackButton() {
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Go back", style: .plain, target: self, action: #selector(pop))
        newBackButton.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    @objc
    func pop() {
        descriptionPresenter?.router?.popViewController()
    }
}
