//
//  MainTableViewDataSource.swift
//  DataSourceArticle
//
//  Created by Erim Sengezer on 8.12.2022.
//

import UIKit

class MainTableViewDataSource: NSObject {
    private var response: [MovieModel]?
    
    func update(response: [MovieModel]) {
        self.response = response
    }
}

extension MainTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = response?[indexPath.row].title
        return cell
    }
}
