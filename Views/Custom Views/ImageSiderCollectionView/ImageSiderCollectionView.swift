//
//  ImageSiderCollectionView.swift
//  easypeasy
//
//  Created by Akhtar on 11/17/20.
//

import UIKit
import Foundation


class ImageSiderCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var framImageView: UIImageView!
    private var imagesArray = [FrameCardImageModel]()
    var currentPageIndex: ((Int)->())?
    var cellTappHandler: (()->())?
    
    private var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .clear
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.backgroundColor = .clear
        self.backgroundColor = .clear
        
        collectionView.register(UINib.init(nibName: ImageSliderCell.className, bundle: nil), forCellWithReuseIdentifier: ImageSliderCell.className)

        return view
    }
    
    
    func initWithImagesArray(imageList:[FrameCardImageModel], frameImageUrl:String) {
        self.bringSubviewToFront(self.collectionView)
        self.bringSubviewToFront(self.framImageView)
        self.imagesArray = imageList
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.reloadData()
        
        
        if frameImageUrl.isEmpty {
            self.framImageView.isHidden = true
        } else {
            self.framImageView.isHidden = false
            setTimer()
            //load frame image from url
            if let url = URL(string: frameImageUrl){
                self.framImageView.sd_setImageWithURLWithFade(url: url, placeholderImage:Icons.RECTANGLE_PLACEHOLDER)
            }else{
                self.framImageView.image = Icons.RECTANGLE_PLACEHOLDER
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSliderCell.className, for: indexPath) as! ImageSliderCell
        cell.configureCell(imageURLs: self.imagesArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 196)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.cellTappHandler?()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageWidth = self.collectionView!.frame.size.width
        self.currentPageIndex?((Int(self.collectionView!.contentOffset.x / pageWidth)))
    }
    
    func setTimer() {
         let _ = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.autoScroll), userInfo: nil, repeats: true)
    }
    
    @objc func autoScroll() {
        
        //get cell size
            let cellSize = view.frame.size

            //get current content Offset of the Collection view
            let contentOffset = collectionView.contentOffset

            if collectionView.contentSize.width <= collectionView.contentOffset.x + cellSize.width
            {
                let r = CGRect(x: 0, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
                collectionView.scrollRectToVisible(r, animated: false)

            } else {
                let r = CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
                collectionView.scrollRectToVisible(r, animated: true);
            }
    }
    
}
