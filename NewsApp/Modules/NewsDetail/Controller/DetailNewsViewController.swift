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
        self.tableviewDetail.register(UINib(nibName: TableviewCell.kDetailHeaderTableViewCell, bundle: nil),
                                      forCellReuseIdentifier: TableviewCell.kDetailHeaderTableViewCell)
        self.tableviewDetail.register(UINib(nibName: TableviewCell.kNewsContentTableViewCell, bundle: nil),
                                      forCellReuseIdentifier: TableviewCell.kNewsContentTableViewCell)
    }
}

// UITableView DataSource and Delegate
extension DetailNewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if itemsArray[indexPath.row] == .header {
            let cell = self.tableviewDetail.dequeueReusableCell(withIdentifier: TableviewCell.kDetailHeaderTableViewCell,
                                                                for: indexPath) as! DetailHeaderTableViewCell
            cell.updateData(data: self.article)
            return cell
            
        } else if itemsArray[indexPath.row] == .middle {
            let cell = self.tableviewDetail.dequeueReusableCell(withIdentifier: TableviewCell.kNewsContentTableViewCell,
                                                                for: indexPath) as! DetailMiddleTableVieCell
            cell.updateData(data: self.article)
            // Guard let
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

    func invalidURLAlert(){
        self.addAlertController(title: "Invalid URL", message: "News you are trying to visit was removed due to some reason(s).", actions: ["OK"])
    }
 
}
