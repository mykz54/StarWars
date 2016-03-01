//
//  DetailViewController.swift
//  StarWars
//
//  Created by Michael San Minay on 29/02/2016.
//  Copyright © 2016 Michael San Minay. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var peopleContainer: UIView!

    @IBOutlet weak var table: UITableView!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        
        
        if let detail = self.detailItem {
         
              self.title = detail as? String
        
        }
        

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 

}

