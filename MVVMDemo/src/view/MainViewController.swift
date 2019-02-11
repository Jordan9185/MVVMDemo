//
//  MainViewController.swift
//  MVVMDemo
//
//  Created by Jordan Lin on 2019/1/28.
//  Copyright © 2019 Jordan Lin. All rights reserved.
//

import UIKit
import RxSwift

class MainViewController: UITableViewController {
    
    // MARK: Properties
    private lazy var viewModel: MainViewModel = {
        let vm = MainViewModel()
        vm.posts.asObservable().bind { (posts) in
            self.posts = posts
            }.disposed(by: bag)
        return vm
    }()
    
    private let bag = DisposeBag()
    
    private var posts: [Post] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: Controller Life Cycle
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
        registCells()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getAllPost()
    }
    
    // MARK: Instance Functions
    private func registCells() {
        self.tableView.registerCell(PostTableCell.self)
    }
    
    // MARK: TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueCell(PostTableCell.self, indexPath: indexPath)
        cell.bind(post: posts[indexPath.row])
        return cell
    }
}
