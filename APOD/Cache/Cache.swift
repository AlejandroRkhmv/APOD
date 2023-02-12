//
//  Cache.swift
//  APOD
//
//  Created by Александр Рахимов on 10.02.2023.
//

import UIKit

class Cache {
    
    var cachedData: NSCache<AnyObject, UIImage> = {
        let cache = NSCache<AnyObject, UIImage>()
        return cache
    }()
}
