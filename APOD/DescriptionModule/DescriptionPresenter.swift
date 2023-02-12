//
//  DescriptionPresenter.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation

class DescriptionPresenter: IDescriptionPresenter {
    
    weak var descriptionViewController: IDescriptionViewController?
    var router: IRouter?
    var text: String?
    
    required init(descriptionViewController: IDescriptionViewController?, router: IRouter?, text: String?) {
        self.descriptionViewController = descriptionViewController
        self.router = router
        self.text = text
    }
    
    func descriptionViewControllerDidAppear() {
        guard let text = text else { return }
        
        DispatchQueue.main.async {
            self.descriptionViewController?.setText(text: text)
        }
    }
    
}
