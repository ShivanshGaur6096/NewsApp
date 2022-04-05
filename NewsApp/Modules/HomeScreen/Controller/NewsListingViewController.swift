//
//  ViewController.swift
//  Working with API
//
//  Created by Shivansh Gaur on 17/09/21.
//

import UIKit

class NewsListingViewController: UIViewController {
    
    @IBOutlet weak var tableviewNewsFeed: UITableView!
    var arrayArticles: [Articles] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        getNewsFeeds(newsType: appleNewsURL)
    }
    
    func tableViewSetup() {
        self.tableviewNewsFeed.register(UINib(nibName: TableviewCell.kNewsFeedTableViewCell, bundle: nil),
                                        forCellReuseIdentifier: ViewControllerIdentifier.kCell)
        tableviewNewsFeed.delegate = self
        tableviewNewsFeed.dataSource = self
    }

    // MARK: API Calling
    func getNewsFeeds(newsType: String) {
        let newsURL = URL(string: newsType)
        if let url = newsURL {
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil && data != nil {
                do {
                    let json = try JSONDecoder().decode(NewsFeed.self, from: data!)
                    self.arrayArticles = json.articles ?? []
                    DispatchQueue.main.async {
                        self.tableviewNewsFeed.reloadData()
                    }
                } catch let err {
                    print(err.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }
    }

    @IBAction func refreshNews(_ sender: Any) {
        getNewsFeeds(newsType: businessNewsURL)
    }
}

extension NewsListingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayArticles.count
    }

    // swiftlint:disable force_cast
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableviewNewsFeed.dequeueReusableCell(withIdentifier: ViewControllerIdentifier.kCell,
                                                              for: indexPath) as! NewsFeedTableViewCell
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
        guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: ViewControllerIdentifier.kDetailPage) as? DetailNewsViewController
        else { return }
        nextViewController.article = arrayArticles[indexPath.row]
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

    func futureUpdate() {
        addAlertController(title: FutureUpdateAlertMessage.kTitle,
                           message: FutureUpdateAlertMessage.kMessage,
                           actions: [FutureUpdateAlertMessage.kAction])
    }
}
