//
//  NewsAppWeb.swift
//  NewsApp
//
//  Created by Shivansh Gaur on 21/09/21.
//

import Foundation
import UIKit

class NewsAppWeb {
    static func openURLIntoNativeBrowser(url: String) {
        if let url = URL(string: url), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, completionHandler: nil)
        }
    }
}
