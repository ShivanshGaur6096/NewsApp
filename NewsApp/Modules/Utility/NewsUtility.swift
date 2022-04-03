//
//  NewsUtility.swift
//  NewsApp
//
//  Created by Shivansh Gaur on 03/04/22.
//

import Foundation
import UIKit

class NewsUtility {

    // MARK: - Load Data form API
//    public func getNewsFeeds(newsType: String, tableView: UITableView) -> [Articles] {
//        let newsURL = URL(string: newsType)
//        guard let url = newsURL else{ return [] }
//        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if error == nil && data != nil {
//                do {
//                        let json = try JSONDecoder().decode(NewsFeed.self, from: data!)
//                        print(json)
//                        return json
//                        DispatchQueue.main.async {
//                            tableView.reloadData()
//                        }
//                } catch let err {
//                    print(err.localizedDescription)
//                }
//            }
//        }
//        dataTask.resume()
//
//    }


    // MARK: - Load Mock Data
//    func getMockNewsData() -> [Articles] {
//        if let address = Bundle.main.path(forResource: "SampleNewsData", ofType: "json") {
//            do {
//                let data = try Data(contentsOf: address)
//                let newsData = try JSONDecoder().decode(NewsFeed.self, from: data)
//                return newsData
//            } catch let err {
//                print(err.localizedDescription)
//                return []
//            }
//        }
//        return []
//    }
}
