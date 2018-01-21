//
//  ImageCollectionViewCell.swift
//  ImageGallery
//
//  Created by KangKang on 2018/1/5.
//  Copyright © 2018年 KangKang. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var imageURL: URL? {
        didSet {
            if oldValue != imageURL {
                fetchImage()
            }
        }
    }
    
    // MARK: Private Implementations
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            spinner.stopAnimating()
        }
    }
    
    private func fetchImage() {
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        if let url = imageURL {
            spinner.startAnimating()
            
            let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
            if let cacheResponse = URLCache.shared.cachedResponse(for: urlRequest) {
                self.image = UIImage(data: cacheResponse.data)
            } else {
                session.dataTask(with: urlRequest, completionHandler: { [weak self] (data, response, error) in
                    DispatchQueue.main.async {
                        if let imageData = data, url == self?.imageURL {
                            self?.image = UIImage(data: imageData)
                            URLCache.shared.storeCachedResponse(CachedURLResponse(response: response!, data: imageData), for: urlRequest)
                        } else {
                            self?.image = UIImage(named: "close_red")
                        }
                    }
                }).resume()
            }
            
//            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
//                let data = try? Data(contentsOf: url)
//                DispatchQueue.main.async {
//                    if let imageData = data, url == self?.imageURL {
//                        self?.image = UIImage(data: imageData)
//                    } else {
//                        self?.image = UIImage(named: "close_red")
//                    }
//                }
//            }
        }
    }
}
