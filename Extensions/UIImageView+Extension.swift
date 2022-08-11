//
//  UIImageView+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 08/10/2020.
//

import UIKit
import Photos
import SDWebImage
import SVGKit

extension UIImageView {
    
    func fetchImageAsset(_ asset: PHAsset?, size:CGSize, completionHandler: ((Bool) -> Void)?) {
        
        guard let asset = asset else {
            completionHandler?(false)
            return
        }
        
        let options = PHImageRequestOptions()
        options.isSynchronous = false
        
        PHImageManager.default().requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: nil) { [weak self] (image, info) -> Void in
//            let imageView = UIImageView(image: image)
//            imageView.frame.size = cell.frame.size
//            imageView.contentMode = .scaleAspectFill
//            imageView.clipsToBounds = true
//            cell.contentView.addSubview(imageView)
            
            self?.image = image
            self?.contentMode = .scaleAspectFill
            self?.clipsToBounds = true
            completionHandler?(true)
        }
        
//        PHCachingImageManager.default().requestImageData(for: asset, options: options) { [weak self] (data, uti, orientation, info) in
//
//            //        PHImageManager.default().requestImageData(for: asset, options: options) { [weak self] data, uti, orientation, info in
//            guard let info = info else { return }
//
//            if let error = info[PHImageErrorKey] as? Error {
//                print("Cannot fetch data for GIF image: \(error)")
//                return
//            }
//
//            if let isInCould = info[PHImageResultIsInCloudKey] as? Bool, isInCould {
//                print("Cannot fetch data from cloud. Option for network access not set.")
//                return
//            }
//
//            if let gifImageData = data {
//                let pickedImage = UIImage(data: gifImageData) ?? Icons.RECTANGLE_PLACEHOLDER!
//                self?.image = pickedImage
//                self?.contentMode = .scaleAspectFill
//                self?.clipsToBounds = true
//                completionHandler?(true)
//            }
//        }
    }
    
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: 1, height: 2)
        containerView.layer.shadowRadius = 2
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
    
    public func sd_setImageWithURLWithFade(url: URL!, placeholderImage placeholder: UIImage!)
    {
        self.sd_setImage(with: url, placeholderImage: placeholder,options: SDWebImageOptions(rawValue: 0)) { (image, error, cacheType, url) -> Void in
            
            if let downLoadedImage = image
            {
                if cacheType == .none
                {
                    self.alpha = 0
                    UIView.transition(with: self, duration: 0.4, options: UIView.AnimationOptions.transitionCrossDissolve, animations: { () -> Void in
                        self.image = downLoadedImage
                        self.alpha = 1
                    }, completion: nil)
                }
            }
            else
            {
                self.image = placeholder
            }
        }
    }
    
    func downloadSVG(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let receivedicon: SVGKImage = SVGKImage(data: data),
                let image = receivedicon.uiImage
            else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    
    func downloadSVGEcard(from url: URL, completionHandler: @escaping (_ image: UIImage?) -> ()) {
        let session = URLSession.shared
    //    let url = URL(string: image_url)
            
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Error fetching the image! 😢")
                completionHandler(nil)
            } else {
                DispatchQueue.main.async() {
                    let receivedicon: SVGKImage = SVGKImage(data: data)
                    let image = receivedicon.uiImage
                    completionHandler(image)
                }
            }
        }
            
        dataTask.resume()
    }

}


