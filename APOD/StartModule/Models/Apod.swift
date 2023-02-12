//
//  Apod.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation

class Apod: ApodElement {
    
    let date: String?
    var explanation: String?
    let hdurl: String?
    let title: String?
    let mediaType: String?
    
    init?(data: ApodAPI) {
        self.date = data.date
        self.explanation = data.explanation
        self.hdurl = data.url
        self.title = data.title
        self.mediaType = data.mediaType
    }
}
