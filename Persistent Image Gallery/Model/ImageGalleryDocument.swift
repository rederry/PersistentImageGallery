//
//  ImageGalleryDocument.swift
//  Persistent Image Gallery
//
//  Created by KangKang on 2018/1/18.
//  Copyright © 2018年 KangKang. All rights reserved.
//

import UIKit

class ImageGalleryDocument: UIDocument {
    
    var imageGallery: ImageGallery?
    
    override func contents(forType typeName: String) throws -> Any {
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        
    }
}
