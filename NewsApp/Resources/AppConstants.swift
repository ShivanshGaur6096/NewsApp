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
    static let API_Key = "f94188b93edf4865af139885c6d99c68"
}
struct NewsCategory {
    static let kAppleNews = "/everything?q=apple&from=" + Date.returnPreviousDate() + "&to=" + Date.returnCurrentDate() + "&sortBy=All&apiKey="
    static let kTeslaNews = "/everything?q=tesla&from=" + Date.returnPreviousDate() + "&sortBy=publishedAt&apiKey="
    static let kBussinessNews = "/top-headlines?country=in&category=business&apiKey="
    static let kTechCrunchNews = "/top-headlines?sources=techcrunch&apiKey="
    static let kWallStreetNews = "/everything?domains=wsj.com&apiKey="
}

// Date Change
let appleNewsURL = ApiStuffs.kBaseUrl + NewsCategory.kAppleNews + ApiStuffs.API_Key
let teslaNewsURL = ApiStuffs.kBaseUrl + NewsCategory.kTeslaNews + ApiStuffs.API_Key
let businessNewsURL = ApiStuffs.kBaseUrl + NewsCategory.kBussinessNews + ApiStuffs.API_Key
let techCrunchURL = ApiStuffs.kBaseUrl + NewsCategory.kTechCrunchNews + ApiStuffs.API_Key
let wallStreetURL = ApiStuffs.kBaseUrl + NewsCategory.kWallStreetNews + ApiStuffs.API_Key

// DRY Rules - Don't Repeat Yourself
struct TableviewCell {
    static let kDetailHeaderTableViewCell   = "DetailHeaderTableViewCell"
    static let kNewsContentTableViewCell    = "DetailMiddleTableVieCell"
    static let kNewsFeedTableViewCell       = "NewsFeedTableViewCell"
}

struct Storyboard {
    static let kMain = "Main"
}

struct ViewControllerIdentifier {
    static let  kCell = "cell"
    static let  kdetailPage = "detailPage"
}


