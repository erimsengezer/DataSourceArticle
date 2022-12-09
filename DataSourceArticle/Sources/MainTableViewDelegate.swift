//
//  MainTableViewDelegate.swift
//  DataSourceArticle
//
//  Created by Erim Sengezer on 8.12.2022.
//

import UIKit

protocol MainTableViewDelegateOutput: AnyObject {
    func didSelectRow(indexPath: IndexPath)
}

class MainTableViewDelegate: NSObject {
    weak var output: MainTableViewDelegateOutput?
}

extension MainTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.output?.didSelectRow(indexPath: indexPath)
    }
}
