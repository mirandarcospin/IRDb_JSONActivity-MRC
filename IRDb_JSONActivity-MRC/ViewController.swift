//
//  ViewController.swift
//  IRDb_JSONActivity-MRC
//
//  Created by Miranda Ramirez Cospin on 10/20/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailItem: Entry? {
        didSet {
            configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func configureView() {
        
    }


}

