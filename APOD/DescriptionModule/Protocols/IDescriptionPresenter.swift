//
//  IDescriptionProtocol.swift
//  APODs
//
//  Created by Александр Рахимов on 10.02.2023.
//

import Foundation

protocol IDescriptionPresenter: AnyObject {
    
    var descriptionViewController: IDescriptionViewController? { get set }
    var router: IRouter? { get set }
    var text: String? { get set }
    
    init(descriptionViewController: IDescriptionViewController?, router: IRouter?, text: String?)
    
    func descriptionViewControllerDidAppear()
}
