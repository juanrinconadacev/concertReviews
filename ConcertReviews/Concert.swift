class Concert : Codable {
    static public let MAX_RATING: Float = 5
    public let image: String // Imagen del concierto (sólo lectura)
    public let band: String // Nombre del grupo (sólo lectura)
    var reviews: [Review]
    // Media de reseñas (sólo lectura)
    private var _averageRating: Float?
    public var averageRating: Float? {
        get {
            if reviews.count == 0 {
                return nil
            }
            let total = reviews.reduce(0) { sum, review in
                review.rating + sum
            }
            return Float(total) / Float(reviews.count)
        }
    }
    
    init(image: String, band: String) {
        self.image = image
        self.band = band
        self.reviews = []
    }
}
