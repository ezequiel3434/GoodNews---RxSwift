//
//  NewsTableViewController.swift
//  GoodNews
//
//  Created by Ezequiel Parada Beltran on 05/12/2020.
//

import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.setStatusBar(backgroundColor: UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0))
    }
    
    private func populateNews(){
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=0f592d1c093f4f56885e639c2b770da5")
        
        Observable.just(url)
            .flatMap { (url) -> Observable<Data> in
                let request = URLRequest(url: url!)
                return URLSession.shared.rx.data(request: request)
            }.map { (data) -> [Article]? in
                return try? JSONDecoder().decode(ArticleList.self, from: data).articles
            }.subscribe(onNext:{ [weak self] articles in
                guard let self = self else {return}
                if let articles = articles {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            })
    }
    
}


extension UINavigationController {

    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }

}
