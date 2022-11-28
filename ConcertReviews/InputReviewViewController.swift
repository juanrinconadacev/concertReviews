//
//  InputReviewViewController.swift
//  ConcertReviews
//
//  Created by Alumnos on 22/11/22.
//

import UIKit

class InputReviewViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var rating: Int = 3
    var comment: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton.isEnabled = false
    }

    @IBAction func ratingChanged(_ sender: UISlider) {
        let ratingValue = sender.value
        let ratingRounded = roundf(ratingValue)
        rating = Int(ratingRounded)
        ratingLabel.text = String(rating)
        sender.value = ratingRounded
    }
    
    @IBAction func commentChanged(_ sender: UITextField) {
        if (sender.text!.isEmpty) {
            sendButton.isEnabled = false
        } else {
            sendButton.isEnabled = true
        }
        comment = sender.text!
        // Modalidad Pro: sendButton.isEnabled = !sender.text?.isEmpty
    }
    
    @IBAction func sendReview(_ sender: UIButton) {
        // Crear reseña
        let review = Review(rating: rating, comment: comment)
        // Obtener concierto actual
        let currentConcert = DataManager.concerts[DataManager.selectedConcert!]
        // Añadir nueva reseña
        currentConcert.reviews.append(review)
        // Guardar los conciertos con la nueva reseña
        DataManager.saveConcerts()
        // Guardar la reseña de éste usuario
        DataManager.getUsuario()?.reviews?.append(review)
        DataManager.saveUser()
        // Volver a la pantalla de conciertos
        navigationController?.popToRootViewController(animated: true)
    }
    
}
