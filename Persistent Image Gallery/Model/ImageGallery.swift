//
//  ImageGallery.swift
//  ImageGallery
//
//  Created by KangKang on 2018/1/10.
//  Copyright © 2018年 KangKang. All rights reserved.
//

import Foundation

class ImageGallery: Codable {
    var name: String
    var images = [ImageModel]()
    
    struct ImageModel: Codable {
        let url: URL
        let aspectRatio: Double
    }
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json: Data) {
        if let newValue = try? JSONDecoder().decode(ImageGallery.self, from: json) {
            name = newValue.name
            images = newValue.images
        } else {
            return nil
        }
        
    }
    
    init(name: String) {
        self.name = name
    }
}
