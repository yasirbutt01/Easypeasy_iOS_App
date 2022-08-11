//
//  PHAsset+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 12/10/2020.
//

import UIKit
import Photos

extension PHAsset {
    var thumbnailImage : UIImage {
        get {
            let manager = PHImageManager.default()
            let option = PHImageRequestOptions()
            var thumbnail = UIImage()
            option.isSynchronous = true
            manager.requestImageData(for: self, options: option) { (data, str, orientation, info) in
                if let dt = data {
                    thumbnail = UIImage(data: dt) ?? (Icons.RECTANGLE_PLACEHOLDER!)
                } else {
                    thumbnail = Icons.RECTANGLE_PLACEHOLDER!
                }
            }
//            manager.requestImage(for: self, targetSize: CGSize(width: 300, height: 300), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
//                thumbnail = result ?? (Icons.RECTANGLE_PLACEHOLDER!)
//            })
            return thumbnail
        }
    }
}
