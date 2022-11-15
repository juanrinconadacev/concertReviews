
import UIKit

class ConcertListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var concertsTableView: UITableView!
    
    let concerts: [Concert] = [Concert(image: "eminem", band: "Eminem"),
                               Concert(image: "brucespringsteen", band: "Bruce Springsteen"),
                               Concert(image: "gunsnroses", band: "Guns 'n' Roses"),
                               Concert(image: "daftpunk", band: "Daft Punk")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        concertsTableView.dataSource = self
        concertsTableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return concerts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let concertRow: ConcertRow = tableView.dequeueReusableCell(withIdentifier: "concertRowID", for: indexPath) as! ConcertRow
        let concert = concerts[indexPath.row]
        
        concertRow.band.text = concert.band
        concertRow.concertImage.image = UIImage(named: concert.image)
        
        if let averageRating = concert.averageRating {
            concertRow.averageRating.progress = averageRating / Concert.MAX_RATING
        } else {
            concertRow.averageRating.isHidden = true
        }
        
        return concertRow
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToConcertDetail", sender: concerts[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let concertViewController = segue.destination as! ConcertViewController
        let concert = sender as! Concert
        concertViewController.concert = concert
    }

}

