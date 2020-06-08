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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(interactor: GiledeRoseInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: "GiledeRoseViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
