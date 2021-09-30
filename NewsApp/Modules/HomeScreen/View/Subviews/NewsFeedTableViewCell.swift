//
//  NewsFeedTableViewCell.swift
//  NewsApp
//
//  Created by Shivansh Gaur on 17/09/21.
//

import UIKit

class NewsFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewNews: UIImageView?
    @IBOutlet weak var title: UILabel?
    @IBOutlet weak var newsSource: UILabel!

    var favoriteTheNews: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateData(data: Articles?) {
        self.selectionStyle = .none
        self.title?.text = data?.title
        imageViewNews?.downloaded(from: data?.urlToImage ?? emptyString)
        self.newsSource?.text = "Source: " + String(data?.source?.name ?? "Unknown")
    }

    @IBAction func favThisNews(_ sender: UIButton) {
        favoriteTheNews?()
    }
}
