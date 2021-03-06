//
//  DetailNewsViewController.swift
//  NewsApp
//
//  Created by Shivansh Gaur on 19/09/21.
//

import UIKit

enum Section {
    case header
    case middle
    case bottom
}

class DetailNewsViewController: UIViewController {

    @IBOutlet weak var tableviewDetail: UITableView!
    var article: Articles?
    let itemsArray: [Section] = [.header, .middle, .bottom]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
    }

    func tableViewSetup() {
        registerTableViewCells()
        tableviewDetail.delegate = self
        tableviewDetail.dataSource = self
        tableviewDetail.rowHeight = UITableView.automaticDimension
        tableviewDetail.estimatedRowHeight = 44.0
    }

    func registerTableViewCells() {
        self.tableviewDetail.register(UINib(nibName: TableviewCell.kDetailHeaderCell, bundle: nil),
                                      forCellReuseIdentifier: TableviewCell.kDetailHeaderCell)
        self.tableviewDetail.register(UINib(nibName: TableviewCell.kNewsContentCell, bundle: nil),
                                      forCellReuseIdentifier: TableviewCell.kNewsContentCell)
    }
}

extension DetailNewsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if itemsArray[indexPath.row] == .header {
            guard let cell = self.tableviewDetail.dequeueReusableCell(withIdentifier: TableviewCell.kDetailHeaderCell,
                                                                      for: indexPath) as? DetailHeaderTableViewCell
            else { return UITableViewCell() }
            cell.updateData(data: self.article)
            cell.applyAccessibility()
            return cell
        } else if itemsArray[indexPath.row] == .middle {
            guard let cell = self.tableviewDetail.dequeueReusableCell(withIdentifier: TableviewCell.kNewsContentCell,
                                                                      for: indexPath) as? DetailDescriptionTableViewCell
            else { return UITableViewCell() }
            cell.updateData(data: self.article)
            cell.applyAccessibility()
            guard article?.url != nil else {
                invalidURLAlert()
                return UITableViewCell()
            }
            cell.onCellTapCallback = { [weak self] in
                NewsAppWeb.openURLIntoNativeBrowser(url: self?.article?.url ?? emptyString)
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func invalidURLAlert() {
        self.addAlertController(title: InvalidURLAlertMessage.kTitle,
                                message: InvalidURLAlertMessage.kMessage,
                                actions: [InvalidURLAlertMessage.kAction])
    }
}
