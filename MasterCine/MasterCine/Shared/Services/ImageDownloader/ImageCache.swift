//
//  ImageCache.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 13/05/26.
//

import Foundation
import UIKit

final class ImageCache {
    static let shared = ImageCache()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func get(key: String) -> UIImage? {
        cache.object(forKey: key as NSString)
    }
    
    func save(key: String, image: UIImage) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func remove(key: String) {
        cache.removeObject(forKey: key as NSString)
    }
    
    func removeAll() {
        cache.removeAllObjects()
    }
}
