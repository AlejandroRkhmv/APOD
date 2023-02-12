//
//  ExtensionForStartView.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation
import UIKit

protocol StartViewControllerDelegate {
    func myApodsButtonTapped()
}

extension StartView {
    
    func createBackgroundImage() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode = .scaleAspectFill
        self.addSubview(backgroundImage)
    }
    
    func setConstraintsForBackgroundImage() {
        backgroundImage.widthAnchor.constraint(equalToConstant: self.bounds.size.width).isActive = true
        backgroundImage.heightAnchor.constraint(equalToConstant: self.bounds.size.height).isActive = true
        backgroundImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        backgroundImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
    func createGetApodButton() {
        getApodButton.translatesAutoresizingMaskIntoConstraints = false
        getApodButton.backgroundColor = .white
        getApodButton.setTitle("Get APOD", for: .normal)
        getApodButton.setTitleColor(.black, for: .normal)
        getApodButton.setTitleColor(.gray, for: .highlighted)
        getApodButton.layer.cornerRadius = 10
        self.addSubview(getApodButton)
    }
    
    func setConstraintsGetApodButton() {
        getApodButton.widthAnchor.constraint(equalToConstant: 270).isActive = true
        getApodButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        getApodButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        self.centerYAnchor.constraint(equalTo: getApodButton.centerYAnchor, constant: 100).isActive = true
    }
    
    func createMyApodsButton() {
        myApodsButton.translatesAutoresizingMaskIntoConstraints = false
        myApodsButton.backgroundColor = .white
        myApodsButton.setTitle("my APOD", for: .normal)
        myApodsButton.setTitleColor(.black, for: .normal)
        myApodsButton.layer.cornerRadius = 10
        self.addSubview(myApodsButton)
    }
    
    func setConstraintsMyApodsButton() {
        myApodsButton.widthAnchor.constraint(equalToConstant: 270).isActive = true
        myApodsButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        myApodsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        myApodsButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 100).isActive = true
    }
    
    @objc
    func getApodButtonTapped() {
        createDateAlertController()
    }
    
    @objc
    func myApodButtonTapped() {
        delegate?.myApodsButtonTapped()
    }
    
    private func createDateAlertController() {
        let dateAlertController = UIAlertController(title: "Enter date to get an astronomy picture\n and press OK", message: messege , preferredStyle: .alert)
        dateAlertController.view.translatesAutoresizingMaskIntoConstraints = false
        dateAlertController.view.widthAnchor.constraint(equalToConstant: self.bounds.width).isActive = true
        dateAlertController.view.heightAnchor.constraint(equalToConstant: 270).isActive = true
        dateAlertController.addTextField() { textField in
            textField.placeholder = "2023-01-14"
        }
        let action = UIAlertAction(title: "OK", style: .default) { action in
            guard let text = dateAlertController.textFields?[0].text else { return }
            if self.checkEnteredDate(dateString: text) {
                self.completion?(text)
            } else {
                self.createWarningAlertController()
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        dateAlertController.addAction(action)
        dateAlertController.addAction(cancel)
        self.window?.rootViewController?.present(dateAlertController, animated: true)
    }
    
    private func checkEnteredDate(dateString: String) -> Bool {
        guard dateString != "" else { return false }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else { return false }
        guard let startDate = dateFormatter.date(from: "1995-06-16") else { return false }
        let endDate = Date()
        
        if date.isBetween(startDate: startDate, endDate: endDate) {
            return true
        }
        return false
    }
    
    func createWarningAlertController() {
        let attributedString = NSAttributedString(string: "\nYour date must be between\n 1995-06-16\n and\n current date!", attributes: [
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20),
                    NSAttributedString.Key.foregroundColor : UIColor.red
                ])
        let warning = UIAlertController(title: "Enter date in format 2023-01-14", message: "", preferredStyle: .alert)
        warning.setValue(attributedString, forKey: "attributedMessage")
        warning.view.translatesAutoresizingMaskIntoConstraints = false
        warning.view.widthAnchor.constraint(equalToConstant: self.bounds.width).isActive = true
        warning.view.heightAnchor.constraint(equalToConstant: 270).isActive = true
        let action = UIAlertAction(title: "I get", style: .cancel) { _ in
            self.createDateAlertController ()
        }
        warning.addAction(action)
        self.window?.rootViewController?.present(warning, animated: true)
    }
}
