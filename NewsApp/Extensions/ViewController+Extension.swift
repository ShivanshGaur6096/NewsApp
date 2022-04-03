//
//  ViewController+Extension.swift
//  NewsApp
//
//  Created by Shivansh Gaur on 30/09/21.
//

import UIKit

extension UIViewController {
    func addAlertController(title: String, message: String, actions:[String]) {
        let invalidURL = UIAlertController(title: title,
                                           message: message,
                                           preferredStyle: UIAlertController.Style.alert)
        // For for action
        for action in actions {
            invalidURL.addAction(UIAlertAction(title: action,
                                               style: UIAlertAction.Style.default,
                                               handler: nil))
        }
        self.present(invalidURL, animated: true, completion: nil)
    }
}
