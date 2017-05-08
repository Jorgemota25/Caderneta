//
//  ViewController.swift
//  Caderneta
//
//  Created by Jorge Mota on 05/05/17.
//  Copyright © 2017 Jorge Mota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabletView: UITableView!
    
    var caderneta : [Caderneta] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
       caderneta = context.fetch(Caderneta.fetchRequest())
    
        } catch {
        }
    }

}

