//
//  ViewController.swift
//  DataSourceArticle
//
//  Created by Erim Sengezer on 8.12.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private Properties
    private var tableViewDataSource: MainTableViewDataSource?
    private var tableViewDelegate: MainTableViewDelegate?
    
    private var responseData: [MovieModel] = [MovieModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createData()
        configureTableView()
        reloadData(response: responseData)
    }
    
    func createData() {
        let firstMovieModel = MovieModel(title: "Iron Man 1", description: "First Iron Man")
        let secondMovieModel = MovieModel(title: "Iron Man 2", description: "Second Iron Man")
        let thirdMovieModel = MovieModel(title: "Iron Man 3", description: "Third Iron Man")
        
        responseData.append(firstMovieModel)
        responseData.append(secondMovieModel)
        responseData.append(thirdMovieModel)
    }

    func configureTableView() {
        self.tableViewDataSource = MainTableViewDataSource()
        self.tableViewDelegate = MainTableViewDelegate()
        self.tableViewDelegate?.output = self
        
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
    }
    
    func reloadData(response: [MovieModel]) {
        tableViewDataSource?.update(response: response)
        tableView.reloadData()
    }

}

extension ViewController: MainTableViewDelegateOutput {
    func didSelectRow(indexPath: IndexPath) {
        print("Index: \(indexPath.row)")
    }
}
