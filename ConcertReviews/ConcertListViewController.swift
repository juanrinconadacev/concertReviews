//
//  ViewController.swift
//  ConcertReviews
//
//  Created by Alumnos on 8/11/22.
//

import UIKit

class ConcertListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var concertsTableView: UITableView!
    
    let concerts: [Concert] = [Concert(image: "foto1", name: "Eminem"),
                               Concert(image: "foto2", name: "Bruce Springsteen"),
                               Concert(image: "foto3", name: "Guns & Roses"),
                               Concert(image: "foto4", name: "Daft Punk")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        concertsTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return concerts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = concerts[indexPath.row].name
        return cell
    }

}

