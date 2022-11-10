class Concert {
    static public let MAX_RATING: Float = 5
    public let image: String // Imagen del concierto (sólo lectura)
    public let band: String // Nombre del grupo (sólo lectura)
    // Media de reseñas (sólo lectura)
    private var _averageRating: Float?
    public var averageRating: Float? {
        get { return _averageRating }
    }
    
    init(image: String, band: String) {
        self.image = image
        self.band = band
    }
}
