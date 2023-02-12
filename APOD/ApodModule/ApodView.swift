//
//  ApodView.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import UIKit

protocol ApodViewDelegate {
    func infoButtonTapped()
}

class ApodView: UIView {
    
    var delegate: ApodViewDelegate?
    
    let titleLabel = UILabel()
    let apodImage = UIImageView()
    let activityIndicator = UIActivityIndicatorView()
    let infoDescriptionButton = UIButton()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setAllUIElementsONApodView()
        addActionToIfoDescriptionButton()
    }
    
    private func setAllUIElementsONApodView() {
        createTitleLabel()
        setConstraintsForTitle()
        createApodImage()
        setApodImageConstraints()
        createActivityIndicator()
        setActivityIndicatorConstraints()
        createInfoDescriptionButton()
        setInfoDescriptionButtonConstraints()
    }
    
    private func addActionToIfoDescriptionButton() {
        infoDescriptionButton.addTarget(self, action: #selector(userTappedInfoDescriptionButton), for: .touchUpInside)
    }
}
