//
//  IApodRouter.swift
//  APOD
//
//  Created by Александр Рахимов on 10.02.2023.
//

import Foundation

protocol IApodPushRouter {
    func pushViewController(object: Apod)
}

protocol IApodPopRouter {
    func popViewController()
}

typealias IApodRouter = IApodPushRouter & IApodPopRouter
