//
//  DescriptionView.swift
//  APOD
//
//  Created by Александр Рахимов on 10.02.2023.
//

import UIKit

class DescriptionView: UIView {
    
    let descriptionLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createDescriptionLabel()
        setdescriptionLabelConstraints()
    }
    
    private func createDescriptionLabel() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .center
        descriptionLabel.contentMode = .scaleAspectFit
        descriptionLabel.numberOfLines = 0
        self.addSubview(descriptionLabel)
    }
    
    private func setdescriptionLabelConstraints() {
        descriptionLabel.widthAnchor.constraint(equalToConstant: self.bounds.size.width - 30).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: self.bounds.size.height - 170).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
