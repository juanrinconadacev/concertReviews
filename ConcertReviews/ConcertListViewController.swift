
import UIKit

class ConcertListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var concertsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        concertsTableView.dataSource = self
        concertsTableView.delegate = self
        DataManager.load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        concertsTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.concerts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let concertRow: ConcertRow = tableView.dequeueReusableCell(withIdentifier: "concertRowID", for: indexPath) as! ConcertRow
        let concert = DataManager.concerts[indexPath.row]
        
        concertRow.band.text = concert.band
        concertRow.concertImage.image = UIImage(named: concert.image)
        
        if let averageRating = concert.averageRating {
            concertRow.averageRating.progress = averageRating / Concert.MAX_RATING
            concertRow.averageRating.isHidden = false
        } else {
            concertRow.averageRating.isHidden = true
        }
        
        return concertRow
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataManager.selectedConcert = indexPath.row
        performSegue(withIdentifier: "goToConcertDetail", sender: DataManager.concerts[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let concertViewController = segue.destination as! ConcertViewController
        let concert = sender as! Concert
        concertViewController.concert = concert
    }

}

