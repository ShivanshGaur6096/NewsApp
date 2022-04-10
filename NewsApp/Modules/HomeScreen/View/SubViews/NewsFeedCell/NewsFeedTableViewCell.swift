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
        setupAccessibility()
    }

    func updateData(data: Articles?) {
        self.selectionStyle = .none
        self.title?.text = data?.title
        imageViewNews?.downloaded(from: data?.urlToImage ?? emptyString)
        self.newsSource?.text = "Source: " + String(data?.source?.name ?? "Unknown")
        updateAccessibilityLabels()
    }

    @IBAction func favThisNews(_ sender: UIButton) {
        favoriteTheNews?()
    }
}

// MARK: - Apply Accessibility
extension NewsFeedTableViewCell: VoiceOverAccessible {
    func setupAccessibility() {
        imageViewNews?.isAccessibilityElement = true
        imageViewNews?.accessibilityHint = "News Image"

        title?.isAccessibilityElement = true
        title?.accessibilityHint = "News Headline"

        newsSource.isAccessibilityElement = true
        newsSource.accessibilityHint = "News Source"
    }

    func assignAccessibilityIds() {
        imageViewNews?.accessibilityIdentifier = "newsImage"
        title?.accessibilityIdentifier = "newsHeadline"
        newsSource.accessibilityIdentifier = "newsSource"
    }

    func updateAccessibilityLabels() {
        /// Need to make it readable for voiceover like "Headline" by "Source" now next headline is
        title?.accessibilityLabel = title?.text
        newsSource.accessibilityLabel = newsSource.text
    }
}
