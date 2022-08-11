//
//  HomeCardCollectionViewCell.swift
//  easypeasy
//
//  Created by Akhtar on 10/7/20.
//

import UIKit

class ImageSliderCell: UICollectionViewCell {

    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(imageURLs: FrameCardImageModel) {
        if let url = URL(string: imageURLs.imageFileThumbnailURL){
            categoryImage.sd_setImageWithURLWithFade(url: url, placeholderImage:Icons.RECTANGLE_PLACEHOLDER)
        }else{
            categoryImage.image = Icons.RECTANGLE_PLACEHOLDER
        }
    }
    
}

