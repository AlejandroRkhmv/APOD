//
//  IStartViewController.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation
import CoreData

protocol IStartViewController: AnyObject {
    
    var startPresenter: IStartPresenter! { get set }
    
    func setBackgroundImageToStartView(from data: Data)
}
