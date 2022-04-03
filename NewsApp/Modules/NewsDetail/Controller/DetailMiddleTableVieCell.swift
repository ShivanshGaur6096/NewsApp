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
        self.newsContent.text = data?.content
    }

    @IBAction func readMoreNews(_ sender: UIButton) {
        onCellTapCallback?()
    }
}
