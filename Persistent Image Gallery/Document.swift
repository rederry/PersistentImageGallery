//
//  Document.swift
//  Persistent Image Gallery
//
//  Created by KangKang on 2018/1/18.
//  Copyright © 2018年 KangKang. All rights reserved.
//

import UIKit

class Document: UIDocument {
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}

