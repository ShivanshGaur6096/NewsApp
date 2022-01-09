//
//  NewsAPI.swift
//  NewsApp
//
//  Created by Shivansh Gaur on 31/12/21.
//

import Foundation

class APIServices {
    static func getNewsFeed() -> [NewsFeed] {
        let newsURL = URL(string: appleNewsURL)
        guard newsURL != nil else {
            return [NewsFeed]()
        }
        
        let dataTask = URLSession.shared.dataTask(with: newsURL!) { (data, response, error) in
            if error == nil && data != nil {
//                let decoder = JSONDecoder()
                do{
                    let newsReceived = try JSONDecoder().decode(NewsFeed.self, from: data!)
                    print(newsReceived)
                } catch {
                    debugPrint(error)
                }
                
            } else {
                print("Error Discription: ")
            }
        }
        return [NewsFeed]()
        dataTask.resume()
    }
    
    
}
