
import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var reviewsTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        reviewsTableView.dataSource = self

        reviewsTableView.reloadData()
        nameTextField.text = DataManager.getUsuario()?.name
    }

    @IBAction func nameChanged(_ sender: UITextField) {
        let name = sender.text
        DataManager.getUsuario()?.name = name
        DataManager.saveUser()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataManager.getUsuario()?.reviews?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reviewRow: ReviewRow = tableView.dequeueReusableCell(withIdentifier: "reviewRowID", for: indexPath) as! ReviewRow
        let review = DataManager.getUsuario()?.reviews![indexPath.row]
        
        reviewRow.ratingProgress.progress = Float(review?.rating ?? 0) / Concert.MAX_RATING
        reviewRow.reviewLabel.text = review?.comment
        
        return reviewRow
        
    }
}
