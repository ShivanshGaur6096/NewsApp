//
//  NewsContentTableViewCell.swift
//  NewsApp
//
//  Created by Shivansh Gaur on 20/09/21.
//

import UIKit

class DetailDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var newsContent: UILabel!
    var onCellTapCallback: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupAccessibility()
    }

    func updateData(data: Articles?) {
        self.selectionStyle = .none
        if data?.content?.hasSuffix("chars]") != nil {
            let newString = data?.content
            let newContent = newString?.dropLast(14)
            self.newsContent.text = String(newContent ?? "Unable to show News Content. Please click on \"Read more\" to view full article on Source website.")
        } else {
            self.newsContent.text = data?.content
        }
        updateAccessibilityLabels()
    }

    @IBAction func readMoreNews(_ sender: UIButton) {
        onCellTapCallback?()
    }
}

// MARK: - Apply Accessibility
extension DetailDescriptionTableViewCell: VoiceOverAccessible {
    func setupAccessibility() {
        newsContent.isAccessibilityElement = true
        newsContent.accessibilityHint = "News Detail Description"
    }

    func assignAccessibilityIds() {
        newsContent.accessibilityIdentifier = "newsContent"
    }

    func updateAccessibilityLabels() {
        newsContent.accessibilityLabel = newsContent.text
    }
}
