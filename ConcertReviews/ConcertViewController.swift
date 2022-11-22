
import UIKit

class ConcertViewController: UIViewController {
    
    var concert: Concert?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bandName: UILabel!
    @IBOutlet weak var averageRating: UIProgressView!
    
    override func viewWillAppear(_ animated: Bool) {
        imageView.image = UIImage(named: concert!.image)
        
        bandName.text = concert?.band
        
        if let rating = concert?.averageRating {
            averageRating.progress = rating / Concert.MAX_RATING
        } else {
            averageRating.isHidden = true
        }
    }

}
