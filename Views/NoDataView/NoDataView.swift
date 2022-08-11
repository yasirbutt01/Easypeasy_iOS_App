//
//  NoDataView.swift
//  easypeasy
//
//  Created by Akhtar on 11/25/20.
//

import UIKit

class NoDataView: UIView {

    private var view: UIView!
    @IBOutlet weak var retryButton: CustomButtonView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var messageLabel: UILabel!
    
    var refreshButtonTappedHandler:(()->())?
    
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
        view.backgroundColor = .white
        addSubview(view)
        
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.backgroundColor = .clear
        return view
    }
    
    func configureView(imageName:String = "", messageString:String = "") -> Void {
        if imageName.isEmpty {} else {
            self.imageView.image = UIImage.init(named: imageName)
        }
        if messageString.isEmpty{
            //No network
        } else {
            //No data
            self.messageLabel.text = messageString
        }
        retryButton.setupView(color: .green, title: "Retry", cornerRadius: 16)
        retryButton.buttonTapped = {
            self.refreshButtonTappedHandler?()
        }
    }
    
}
