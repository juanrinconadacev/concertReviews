
import UIKit

class ConcertViewController: UIViewController {
    
    var concert: Concert?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bandName: UILabel!
    @IBOutlet weak var averageRating: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: concert!.image)
        
        bandName.text = concert?.band
        
        if let rating = concert?.averageRating {
            averageRating.progress = rating
        } else {
            averageRating.isHidden = true
        }
        
    }

}
