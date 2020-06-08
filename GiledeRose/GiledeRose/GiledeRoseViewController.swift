//
//  GiledeRoseViewController.swift
//  GiledeRose
//
//  Created by Yankai Liu on 2020/6/8.
//  Copyright © 2020 ThoughtWorks. All rights reserved.
//

import UIKit

class GiledeRoseViewController: UIViewController {

    var interactor: GiledeRoseInteractorProtocol!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.displayDatas = {[weak self] date in
            guard let self = self else { return }
            self.title = "Day \(date)"
            self.tableView.reloadData()
        }
        tableView.register(GiledeRoseViewCell.self, forCellReuseIdentifier: "GiledeRoseViewCell")
        tableView.reloadData()
        interactor.open()
    }
    
    init(interactor: GiledeRoseInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: "GiledeRoseViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension GiledeRoseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GiledeRoseViewCell") as? GiledeRoseViewCell {
            let product = interactor.dataSource[indexPath.row]
            cell.update(product)
            return cell
        }
        
        return UITableViewCell()
    }
}
