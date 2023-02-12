//
//  Constants.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation

class Constants {
    let nasaApiKey = "Trd0JjTn2Fxf5IVK66vrafTPP1YMZwvWOdokZ3A4"
    let startImageUrlString = ["https://i.pinimg.com/564x/5c/66/69/5c666988eef49f5ffbb2360e827cd8a0.jpg",
                               "https://i.pinimg.com/474x/6f/d0/78/6fd078f0f5ce5b55c35e8f92d7dde57e.jpg",
                               "https://i.pinimg.com/474x/dd/cd/21/ddcd2195fba1d19d70fdaa1d7e1bef89.jpg",
                               "https://i.pinimg.com/474x/c0/89/00/c08900a852bf17f74cc4c0aa0431246b.jpg",
                               "https://i.pinimg.com/474x/6b/51/22/6b51229de00841c058d137308c1a0847.jpg",
                               "https://i.pinimg.com/474x/fd/3b/a1/fd3ba125f3c6399535362c21fe380789.jpg",
                               "https://i.pinimg.com/474x/cf/4b/b1/cf4bb178896cd0d1af7e037df1deba73.jpg",
                               "https://i.pinimg.com/736x/40/3e/d5/403ed56eabc35316f3fca41449e57635.jpg",
                               "https://i.pinimg.com/474x/c5/7b/6d/c57b6df45a1393b6bdabcf4667b866e1.jpg",
                               "https://i.pinimg.com/474x/0b/73/21/0b73216feab6b4090a039f00251a4c0e.jpg"]
    
    var imageIndex: Int {
        let index = Int.random(in: 0...9)
        print(index)
        return index
    }
    
    let videoImage = "https://dummyimage.com/400x600/000/fff.png&text=in+this+date+was+a+video,+sorry"
    
    lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter
    }()
    
    var info: String {
        let textInfo = "Date must be between\n Jun 16, 1995 and \(formatter.string(from: Date()))."
        return textInfo
    }
}
