//
//  ViewController.swift
//  Working with API
//
//  Created by Shivansh Gaur on 17/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableviewNewsFeed: UITableView!
    
    var arrayArticles:[Articles] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        getNewsFeeds()
    }
    
    func tableViewSetup() {
        self.tableviewNewsFeed.register(UINib(nibName: TableviewCell.kNewsFeedTableViewCell, bundle: nil),
                                        forCellReuseIdentifier: ViewControllerIdentifier.kCell)
        tableviewNewsFeed.delegate = self
        tableviewNewsFeed.dataSource = self
    }
    
    func getNewsFeeds() {
        // let emptyURL = ""
        let url = URL(string: businessNewsURL)
        guard url != nil else{ return serverDown() }
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                do {
                    if let jsonData = data {
                        if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                            print(json)
                            let newsFeed: NewsFeed = NewsFeed(dict: json)
                            self.arrayArticles = newsFeed.articles ?? []
                            DispatchQueue.main.async {
                                self.tableviewNewsFeed.reloadData()
                            }
                        }
                    }
                } catch{
                    print("Error in JSON Parsing")
                }
            }
        }
        dataTask.resume()
    }
    @IBAction func refreshNews(_ sender: Any) {
        getNewsFeeds()
    }
}

// UITableView DataSource and Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableviewNewsFeed.dequeueReusableCell(withIdentifier: ViewControllerIdentifier.kCell, for: indexPath) as! NewsFeedTableViewCell
        cell.updateData(data: self.arrayArticles[indexPath.row])
        cell.favoriteTheNews = { [weak self] in
            self!.futureUpdate()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: Storyboard.kMain, bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: ViewControllerIdentifier.kdetailPage) as! DetailNewsViewController
        nextViewController.article = arrayArticles[indexPath.row]
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // Alert on Home Screen
    /// Instead of Popup try to use toast
    func futureUpdate() {
        let invalidURL = UIAlertController(title: "Available Soon",
                                           message: "This feature will be available soon in future updates",
                                           preferredStyle: UIAlertController.Style.alert)
        invalidURL.addAction(UIAlertAction(title: "OK",
                                           style: UIAlertAction.Style.default,
                                           handler: nil))
        self.present(invalidURL, animated: true, completion: nil)
    }
    
    func serverDown() {
        let urlNotFound = UIAlertController(title: "！ Server Down ！",
                                            message: "We are updating our server. Please come back later. You can explore your Favourit and Saved News section.❤️",
                                            preferredStyle: UIAlertController.Style.alert)
        urlNotFound.addAction(UIAlertAction(title: "OK",
                                            style: UIAlertAction.Style.default,
                                            handler: nil))
        urlNotFound.addAction(UIAlertAction(title: "Continue",
                                            style: UIAlertAction.Style.cancel,
                                            handler: nil))
        present(urlNotFound, animated: true, completion: nil)
    }
}

