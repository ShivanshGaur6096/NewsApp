//
//  AppConstants.swift
//  NewsApp
//
//  Created by Shivansh Gaur on 17/09/21.
//

import Foundation

let emptyString = ""

struct ApiStuffs {
    static let kBaseUrl = "https://newsapi.org/v2"
    static let apiKey = "f94188b93edf4865af139885c6d99c68"
}
struct NewsCategory {
    static let kAppleNews = "/everything?q=apple&from=" + Date.returnPreviousDate() + "&to=" + Date.returnCurrentDate() + "&sortBy=All&apiKey="
    static let kTeslaNews = "/everything?q=tesla&from=" + Date.returnPreviousDate() + "&sortBy=publishedAt&apiKey="
    static let kBussinessNews = "/top-headlines?country=in&category=business&apiKey="
    static let kTechCrunchNews = "/top-headlines?sources=techcrunch&apiKey="
    static let kWallStreetNews = "/everything?domains=wsj.com&apiKey="
}

// Date Change
let appleNewsURL = ApiStuffs.kBaseUrl + NewsCategory.kAppleNews + ApiStuffs.apiKey
let teslaNewsURL = ApiStuffs.kBaseUrl + NewsCategory.kTeslaNews + ApiStuffs.apiKey
let businessNewsURL = ApiStuffs.kBaseUrl + NewsCategory.kBussinessNews + ApiStuffs.apiKey
let techCrunchURL = ApiStuffs.kBaseUrl + NewsCategory.kTechCrunchNews + ApiStuffs.apiKey
let wallStreetURL = ApiStuffs.kBaseUrl + NewsCategory.kWallStreetNews + ApiStuffs.apiKey

struct TableviewCell {
    static let kDetailHeaderCell   = "DetailHeaderTableViewCell"
    static let kNewsContentCell    = "DetailMiddleTableVieCell"
    static let kNewsFeedTableViewCell       = "NewsFeedTableViewCell"
}

struct Storyboard {
    static let kMain = "Main"
}

struct ViewControllerIdentifier {
    static let  kCell = "cell"
    static let  kDetailPage = "detailPage"
}

struct FutureUpdateAlertMessage {
    static let kTitle = "Available Soon"
    static let kMessage = "This feature will be available soon in future updates"
    static let kAction = "OK"
}

struct InvalidURLAlertMessage {
    static let kTitle = "Invalid URL"
    static let kMessage = "News you are trying to visit was removed due to some reason(s)."
    static let kAction = "OK"
}
