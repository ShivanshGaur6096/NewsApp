//
//  NewsContentTableViewCell.swift
//  NewsApp
//
//  Created by Shivansh Gaur on 20/09/21.
//

import UIKit

class DetailMiddleTableVieCell: UITableViewCell {

    @IBOutlet weak var newsContent: UILabel!
    var onCellTapCallback: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
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
    }

    @IBAction func readMoreNews(_ sender: UIButton) {
        onCellTapCallback?()
    }
}
