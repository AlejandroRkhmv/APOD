//
//  ApodApi.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation

struct ApodAPI: Codable {
    
    let copyright: String?
    let date: String?
    let explanation: String?
    let hdurl: String?
    let mediaType: String?
    let serviceVersion: String?
    let title: String? 
    let url: String?

    enum CodingKeys: String, CodingKey {
        case copyright
        case date
        case explanation
        case hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title
        case url
    }
}
