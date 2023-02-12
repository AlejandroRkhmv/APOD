//
//  ExtensionForApodView.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import UIKit

extension ApodView {
    
    func createTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        self.addSubview(titleLabel)
    }
    
    func setConstraintsForTitle() {
        titleLabel.widthAnchor.constraint(equalToConstant: self.bounds.size.width - 40).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
    }
    
    func createApodImage() {
        apodImage.translatesAutoresizingMaskIntoConstraints = false
        apodImage.contentMode = .scaleAspectFit
        self.addSubview(apodImage)
    }
    
    func setApodImageConstraints() {
        apodImage.widthAnchor.constraint(equalToConstant: self.bounds.size.width - 40).isActive = true
        apodImage.heightAnchor.constraint(equalToConstant: self.bounds.size.height - 200).isActive = true
        apodImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        apodImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
    }
    
    func createActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.tintColor = .black
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        self.addSubview(activityIndicator)
    }
    
    func setActivityIndicatorConstraints() {
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
    func createInfoDescriptionButton() {
        infoDescriptionButton.translatesAutoresizingMaskIntoConstraints = false
        infoDescriptionButton.setTitle("about image...", for: .normal)
        infoDescriptionButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        infoDescriptionButton.setTitleColor(.white, for: .normal)
        infoDescriptionButton.setTitleColor(.gray, for: .highlighted)
        infoDescriptionButton.backgroundColor = .black
        infoDescriptionButton.layer.cornerRadius = 10
        self.addSubview(infoDescriptionButton)
    }
    
    func setInfoDescriptionButtonConstraints() {
        infoDescriptionButton.widthAnchor.constraint(equalToConstant: self.bounds.size.width - 40).isActive = true
        infoDescriptionButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        infoDescriptionButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: infoDescriptionButton.centerYAnchor, constant: 50).isActive = true
    }
    
    @objc
    func userTappedInfoDescriptionButton() {
        delegate?.infoButtonTapped()
    }
}
