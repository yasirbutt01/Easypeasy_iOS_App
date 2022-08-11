//
//  UITableView+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 06/10/2020.
//

import UIKit

extension UITableView {
    func removeSelection() -> Void {
        if let indexs = self.indexPathsForSelectedRows{
            indexs.forEach({ (indexPath) in
                self.deselectRow(at: indexPath, animated: true)
            })
        }
    }
    
    func bindKeyboardTableView() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowTable(notification:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideTable(notification:)), name:UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboardTable), name:.HIDE_KEYBOARD, object: nil)
        addKeyboardGesture()
    }
    
    func removeBindKeyboardTableView() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboardTable(notification:NSNotification){
        self.resignFirstResponder()
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    @objc func keyboardWillShowTable(notification:NSNotification){
        let userInfo = notification.userInfo!
        let keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        
        let inset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height + 50 + getBottomPadding(), right: 0)
        let offsetY = self.contentOffset.y - keyboardFrame.height + 50 + getBottomPadding()
        DispatchQueue.main.async {
            self.contentInset = inset
            self.scrollIndicatorInsets = inset
            self.contentOffset = CGPoint(x: self.contentOffset.x, y: offsetY)
//            scrollToRowAtIndexPath(editingIndexPath, atScrollPosition: .Top, animated: true)
//            scrollIndicatorInsets = myTableView.contentInset
        }
    }
    
    @objc func keyboardWillHideTable(notification:NSNotification){
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: self.numberOfRows(inSection:  self.numberOfSections - 1) - 1,
                section: self.numberOfSections - 1)
            self.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    private func getBottomPadding() -> CGFloat {
        var bottomPadding: CGFloat = 0.0
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            bottomPadding = window?.safeAreaInsets.bottom ?? 0.0
        }
        return bottomPadding
    }
}
