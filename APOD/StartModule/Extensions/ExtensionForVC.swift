//
//  ExtensionForVC.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import UIKit

extension StartViewController {
    
    func initStartUIElements() {
        self.title = "Astronomy Picture Of the Day"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        addStartView()
        setStartViewConstraints()
    }
    
    
    func addStartView() {
        startView = StartView()
        guard let message = startPresenter.startInteractor?.constants.info else { return }
        startView?.messege = message
        startView?.translatesAutoresizingMaskIntoConstraints = false
        guard let startView = startView else { return }
        view.addSubview(startView)
    }
    
    func setStartViewConstraints() {
        startView?.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
        startView?.heightAnchor.constraint(equalToConstant: view.bounds.size.height).isActive = true
        startView?.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        startView?.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
    
    func userEnterDateAndPressOK() {
        startView?.completion = { text in
            guard let date = text else { return }
            self.startPresenter.userTappedOKButton(date: date)
        }
    }
}

extension StartViewController: IStartViewController {
    
    func setBackgroundImageToStartView(from data: Data) {
        DispatchQueue.main.async {
            guard let image = UIImage(data: data) else { return }
            self.startView?.backgroundImage.image = image
        }
    }
}

extension StartViewController: StartViewControllerDelegate {
    func myApodsButtonTapped() {
        startPresenter.myApodsButtonTapped()
    }
}
