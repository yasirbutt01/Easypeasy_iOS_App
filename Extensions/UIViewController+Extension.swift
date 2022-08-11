//
//  UIViewController+Extension.swift
//  easypeasy
//
//  Created by EXIA on 02/10/2020.
//

import UIKit
import MBProgressHUD
import AVFoundation
import MobileCoreServices
import AVKit
import TOCropViewController

let button: UIButton = UIButton (type: UIButton.ButtonType.custom)
let searchButton = UIBarButtonItem(customView: button)
let notificationButton: UIButton = UIButton (type: UIButton.ButtonType.custom)
let notificationBarButton = UIBarButtonItem(customView: notificationButton)

extension UIViewController {
    
    var hasTopNotch: Bool {
        var result = false
        if #available(iOS 13.0,  *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let delegate = windowScene.delegate as? SceneDelegate {
                    if let window = delegate.window {
                        result = window.safeAreaInsets.top > 20
                    }
                }
            }
//            result = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0 > 20
//            result = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0 > 20
        }else{
            if #available(iOS 11.0, *) {
                result = UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
            } else {
                // Fallback on earlier versions
                result = false
            }
        }
        return result
    }
    
    var hasBottomNotch: Bool {
        var result = false
        if #available(iOS 13.0,  *) {
            result = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.bottom ?? 0 > 20
        }else{
            if #available(iOS 11.0, *) {
                result = UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0 > 20
            } else {
                // Fallback on earlier versions
                result = false
            }
        }
        return result
    }
    
    var topMostViewController: UIViewController {
        switch self {
        case is UINavigationController:
            return (self as! UINavigationController).visibleViewController?.topMostViewController ?? self
        case is UITabBarController:
            return (self as! UITabBarController).selectedViewController?.topMostViewController ?? self
        default:
            return presentedViewController?.topMostViewController ?? self
        }
    }
    
    var isModal: Bool {
        
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func openImageCropper(image: UIImage, controller:UIViewController) {
        let cropViewController = TOCropViewController(croppingStyle: .default, image: image)
        cropViewController.delegate = controller.self as? TOCropViewControllerDelegate
        cropViewController.aspectRatioPickerButtonHidden = true
        cropViewController.rotateButtonsHidden = true
        cropViewController.rotateClockwiseButtonHidden = true
        cropViewController.aspectRatioLockDimensionSwapEnabled = false
        cropViewController.aspectRatioLockEnabled = true
        cropViewController.resetAspectRatioEnabled = false
        cropViewController.resetButtonHidden = true
        cropViewController.customAspectRatio = CGSize(width: 1, height: 1)
        cropViewController.imageCropFrame = CGRect(x: 100, y: view.frame.height/2, width: UIScreen.main.bounds.width - 200, height: 200)
        self.present(cropViewController, animated: true, completion: nil)
    }
    
    func addSearchNotificationButtons(screenType:NavbarScreenType = .simple, searchColor:UIColor = Colors.BLACK){
        
        button.leftImage(image: Icons.NAV_BAR_SEARCH_BUTTON_ICON!, renderMode: UIImage.RenderingMode.alwaysTemplate)
        button.tintColor = searchColor
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        button.removeAllTarget()
        button.addTarget(self, action: #selector(searchButtonPressed(_:)), for: UIControl.Event.touchUpInside)
        
        notificationButton.frame = CGRect(x: 0, y: 0, width: 20, height: 40)
        notificationButton.setImage(Icons.NAV_BAR_NOTIFICATION_ICON, for: .normal)
        notificationButton.contentMode = .right
        notificationButton.tintColor = searchColor
        notificationButton.removeAllTarget()
        notificationButton.addTarget(self, action: #selector(notifButtonPressed(_:)), for: UIControl.Event.touchUpInside)
        setBadgeVal()

        if screenType == .simple {
            if let navcontroller = self.navigationController{
                navcontroller.navigationItem.rightBarButtonItems = [notificationBarButton,searchButton]
            }else{
                self.navigationItem.rightBarButtonItems = [notificationBarButton,searchButton]
            }
        } else {
            self.navigationItem.rightBarButtonItems = [notificationBarButton,searchButton]
        }
        
    }
    
    func setBadgeVal() {
        if let notificationCount = UserDefaults.standard.value(forKey: K.NOTIFICATION_COUNT_KEY) as? Int{
            if notificationCount > 0 {
                notificationBarButton.addBadge(number: 0, withOffset: CGPoint(x: 0, y: -8), andColor: Colors.GREEN, andFilled: true)
            } else {
                notificationBarButton.removeBadge()
            }
        }else{
            notificationBarButton.removeBadge()
        }
    }
    
    @objc func searchButtonPressed(_ sender: UIBarButtonItem) {
        
        if isUserLogin {
            
            if let visibleController = UIApplication.getTopViewController(){
                if visibleController is RecentSearchViewController {
                }else{
                    Router.shared.openRecentSearchViewController(controller: self)
                }
            }
            print("search button pressed")
        }
    }
    
    @objc func notifButtonPressed(_ sender: UIBarButtonItem) {
        
        if isUserLogin {
            UserDefaults.standard.setValue(0, forKey: K.NOTIFICATION_COUNT_KEY)
            UserDefaults.standard.synchronize()
            notificationBarButton.removeBadge()
            
            if let visibleController = UIApplication.getTopViewController(){
                if visibleController is NotificationsViewController {
                }else{
                    Router.shared.openNotificationsViewController(controller: self)
                }
            }
        }
        
//        if let visibleController = UIApplication.getTopViewController(){
//            if visibleController is NotificationsListViewController {
//            }else{
//                if visibleController is ContainerController {
//                    if let navController = (visibleController as! ContainerController).centerController {
//                        if let topVC = navController.viewControllers.last {
//                            Router.shared.openNotificationsListViewController(controller: topVC)
//                        }
//                    }
//                } else {
//                    Router.shared.openNotificationsListViewController(controller: self)
//                }
//            }
//        }
        print("notification button pressed")
    }
    
    func removeBackButtonTitle(){
        let button: UIButton = UIButton (type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: "back_icon"), for: UIControl.State.normal)
        button.contentMode = .left
        button.addTarget(self, action: #selector(backButtonPressed(btn:)), for: UIControl.Event.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 25, height: 40)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: button.imageView!.image!.size.width / 2)
        button.contentHorizontalAlignment = .left
        button.imageView?.contentMode = .scaleAspectFit
        
        let barButton = UIBarButtonItem(customView: button)
        if let navcontroller = self.navigationController{
            navcontroller.navigationItem.leftBarButtonItem = barButton
        }else{
            self.navigationItem.leftBarButtonItem = barButton
        }
    }
    
    @objc func backButtonPressed(btn:UIButton) {
        if let navController = navigationController {
            if navController.viewControllers.count > 1 {
                self.navigationController?.popViewController(animated: true)
            } else if isModal {
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func alertMessage(title: String, alertMessage:String, action: (() -> Void)?)
    {
        if alertMessage.lowercased().contains("cancelled") || alertMessage.lowercased().contains("caused connection abort") || alertMessage.contains("The Internet connection appears to be offline."){
            return
        }
        
        DispatchQueue.main.async {
            self.hideProgressHud()
            self.confirmationMessage(title: title, message: alertMessage, buttonYesTitle: "Ok", buttonCancelTitle: "", hideCancelButton: true, actionYes: {
                action?()
            }, actionCancel: {})
//            let myAlert = UIAlertController(title:title, message:alertMessage, preferredStyle: UIAlertController.Style.alert)
//            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
//                UIAlertAction in
//                action?()
//            }
//            myAlert.addAction(okAction);
//            self.present(myAlert, animated:true, completion:nil)
        }
    }
    
    func showToast(message : String, font: UIFont = .systemFont(ofSize: 12.0)) {
//        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        let toastLabel = UILabel(frame: CGRect(x: 10, y: self.view.frame.size.height-100, width: self.view.frame.width - 20, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 1, delay: 3.0, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func showProgressHud(title:String = K.LOADING_KEY) -> Void {
        let progressHud = MBProgressHUD.showAdded(to: view, animated: true)
        progressHud.label.text = title
    }
    
    func hideProgressHud() -> Void {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view , animated: true)
        }
    }
  
    func openCountryPicker(completion: @escaping (String,String,String) -> Void) -> Void {
        let picker = ADCountryPicker(style: .grouped)
        picker.showCallingCodes = true
        picker.showFlags = true
        picker.pickerTitle = "Select a Country"
        picker.defaultCountryCode = "US"
        picker.alphabetScrollBarTintColor = Colors.BLACK
        picker.alphabetScrollBarBackgroundColor = UIColor.clear
        picker.closeButtonTintColor = Colors.BLACK
        picker.font = Fonts.HELVETICA_REGULAR_16
        picker.flagHeight = 40
        picker.hidesNavigationBarWhenPresentingSearch = false
        picker.searchBarBackgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        picker.didSelectCountryWithCallingCodeClosure = { name, code, dialCode in
            completion(name, code, dialCode)
        }
        self.navigationController?.pushViewController(picker, animated: true)
    }
    
    func shareCardOnSocial(withContentText captionString:String?, mediaImage:UIImage?) {
        
        var shareAll = Array<Any>()
//        if let url = NSURL(string: mediaLink){
//            shareAll.append(url)
//        }
        if let img = mediaImage {
            shareAll.append(img)
        }
        if let caption = captionString{
            shareAll.append(caption)
        }
        
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.print, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.postToVimeo]
        
        
        activityViewController.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
            if !completed {
                // User canceled
                return
            }
            // User completed activity
            print(activityType!.rawValue)
        }
        
        activityViewController.popoverPresentationController?.sourceView = view
        present(activityViewController, animated: true, completion: nil)
    }
    
    func openCameraWithPermision(isVideo: Bool = false, delegateController:UIViewController) -> Void {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            
            let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            switch (authStatus){
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        
                        DispatchQueue.main.async {
                            let imagePicker = UIImagePickerController()
                            imagePicker.delegate = delegateController.self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
                            imagePicker.allowsEditing = true
                            imagePicker.videoMaximumDuration = TimeInterval(20.0)
                            imagePicker.sourceType = UIImagePickerController.SourceType.camera
                            if isVideo {
                                imagePicker.mediaTypes = [kUTTypeMovie as String,kUTTypeVideo as String,kUTTypeAVIMovie as String,kUTTypeMPEG as String,kUTTypeMPEG4 as String]
                            } else {
                                imagePicker.mediaTypes = [kUTTypeImage as String]
                            }
                            imagePicker.modalPresentationStyle = .overFullScreen
                            delegateController.present(imagePicker, animated: true, completion: nil)
                        }
                    }
                }
            case .restricted:
                confirmationMessage(title: "Unable to access the Camera", message: Alerts.CAMERA_PRIVACY_SETTINGS_TEXT, buttonYesTitle: K.SETTINGS_TEXT, buttonCancelTitle: K.CANCEL_TEXT, actionYes: {
                    
                    if let url = URL(string:UIApplication.openSettingsURLString) {
                        if UIApplication.shared.canOpenURL(url) {
                            if #available(iOS 10.0, *) {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            } else {
                                UIApplication.shared.open(url)
                            }
                        }
                    }
                }) {
                }
            case .denied:
                confirmationMessage(title: "Unable to access the Camera", message: Alerts.CAMERA_PRIVACY_SETTINGS_TEXT, buttonYesTitle: K.SETTINGS_TEXT, buttonCancelTitle: K.CANCEL_TEXT, actionYes: {
                    
                    if let url = URL(string:UIApplication.openSettingsURLString) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }
                }) {
                }
            case .authorized:
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = delegateController.self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
                imagePicker.allowsEditing = true
                imagePicker.videoMaximumDuration = TimeInterval(20.0)
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                if isVideo {
                    imagePicker.mediaTypes = [kUTTypeMovie as String,kUTTypeVideo as String,kUTTypeAVIMovie as String,kUTTypeMPEG as String,kUTTypeMPEG4 as String]
                } else {
                    imagePicker.mediaTypes = [kUTTypeImage as String]
                }
                imagePicker.modalPresentationStyle = .overFullScreen
                delegateController.present(imagePicker, animated: true, completion: nil)
            }
        }else{
            alertMessage(title: K.ALERT, alertMessage: Alerts.CAMERA_NOT_SUPPORTED_TEXT, action: {})
        }
    }
    
    func openShareSheet(text:String?,image:UIImage?,link:String?, controller:UIViewController?) -> Void {
        
        var shareAll = Array<Any>()
        if let message = text{
            shareAll.append(message)
        }
        if let img = image {
            shareAll.append(img)
        }
        if let lnk = link{
            if let url = NSURL(string: lnk){
                shareAll.append(url)
            }
        }
        
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
//            self.sharingDone(controller: controller)
        }
        activityViewController.popoverPresentationController?.sourceView = self.view
        present(activityViewController, animated: true, completion: nil)
    }
    
    
    func confirmationMessage(title: String, message: String?,attributedMessage:NSAttributedString = NSAttributedString(string: ""), buttonYesTitle: String, buttonCancelTitle: String, hideCancelButton:Bool = false, actionYes: @escaping (() -> Void), actionCancel: @escaping (() -> Void)) {
        
        let control = Storyboards.POPUPS.instantiateViewController(withIdentifier: HooleyCustomAlertPopUPVC.className) as! HooleyCustomAlertPopUPVC
        control.titleString = title
        control.message = message
        control.attributedMessage = attributedMessage
        control.okButtonTitle = buttonYesTitle
        control.cancelButtonTitle = buttonCancelTitle
        control.hideCancelButton = hideCancelButton
        control.okAction = {
            actionYes()
        }
        
        control.cancelAction = {
            actionCancel()
        }
        control.modalPresentationStyle = .overFullScreen
        self.present(control, animated: false, completion: nil)
        
    }
    
    func openVideoController(urlStr: String) {
        if let videoURL = URL(string: urlStr) {
            let player = AVPlayer(url: videoURL)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        }
    }
    
}
