

import UIKit

class BandsViewController: UIViewController, UITableViewDataSource {
    
    var bands: Bands?
    
    @IBOutlet weak var bandsTableView: UITableView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        bandsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loading()
    }
    
    func loading() {
        bandsTableView.isHidden = true
        messageLabel.isHidden = true
        loader.isHidden = false
        getBands()
    }
    
    func success() {
        bandsTableView.isHidden = false
        messageLabel.isHidden = true
        loader.isHidden = true
    }
    
    func error() {
        bandsTableView.isHidden = true
        messageLabel.isHidden = false
        messageLabel.text = "Error de conexión"
        loader.isHidden = true
    }
    
    func getBands() {
        let url = URL(string: "https://superapi.netlify.app/api/bands")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            DispatchQueue.main.async {
                if (error == nil) {
                    do {
                        self.bands = try JSONDecoder().decode(Bands.self, from: data!)
                        self.bandsTableView.reloadData()
                    } catch let errorJson {
                        print(errorJson)
                        self.error()
                    }
                    self.success()
                } else {
                    print(error)
                    self.error()
                }
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bands?.grupos.count  ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bandRow: BandRow = tableView.dequeueReusableCell(withIdentifier: "bandRowID", for: indexPath) as! BandRow
        let band = bands?.grupos[indexPath.row]
        
        bandRow.bandName.text = band?.nombre
        bandRow.bandBio.text = band?.descripcion
        
        DispatchQueue.global().async {
            do {
                let url = URL(string: band?.imagen ?? "")
                let data = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    bandRow.bandImage.image = UIImage(data: data)
                }
            } catch {
            }
        }
        
        return bandRow
    }

}
