//
//  IApodViewController.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation

protocol IApodViewController: AnyObject {
    
    var apodView: ApodView? { get set }
    func setUI(from data: Data, text: String)
}
