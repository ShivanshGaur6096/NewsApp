//
//  DetailHeaderTableViewCell.swift
//  NewsApp
//
//  Created by Shivansh Gaur on 19/09/21.
//

import UIKit

class DetailHeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewNews: UIImageView?
    @IBOutlet weak var title: UILabel?
    @IBOutlet weak var authorNameAndPublishDate: UILabel!
    @IBOutlet weak var backView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backView.layer.borderWidth = 0
        self.backView.layer.cornerRadius = 10
        self.backView.layer.borderColor = nil
        self.backView.layer.masksToBounds = true

        self.layer.shadowOpacity = 0.18
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false
        setupAccessibility()
    }

    func updateData(data: Articles?) {
        self.selectionStyle = .none
        self.title?.text = data?.description
        imageViewNews?.downloaded(from: data?.urlToImage ?? emptyString)
        self.authorNameAndPublishDate.text = "Published by - \(data?.author ?? "Unknown") on \(Date.redableDateFormat(urlDate: data?.publishedAt))"
        updateAccessibilityLabels()
    }
}

// MARK: - Apply Accessibility
extension DetailHeaderTableViewCell: VoiceOverAccessible {
    func setupAccessibility() {
        backView.isAccessibilityElement = false
        imageViewNews?.isAccessibilityElement = true
        imageViewNews?.accessibilityHint = "News Banner"

        title?.isAccessibilityElement = true
        title?.accessibilityHint = "News Title"

        authorNameAndPublishDate.isAccessibilityElement = true
        authorNameAndPublishDate.accessibilityHint = "Author Name and News Publish Date"
    }

    func assignAccessibilityIds() {
        imageViewNews?.accessibilityIdentifier = "newsImage"
        title?.accessibilityIdentifier = "newsTitle"
        authorNameAndPublishDate.accessibilityIdentifier = "authorNameAndPublishDate"
    }

    func updateAccessibilityLabels() {
        title?.accessibilityLabel = title?.text
        authorNameAndPublishDate.accessibilityLabel = authorNameAndPublishDate.text
    }
}
