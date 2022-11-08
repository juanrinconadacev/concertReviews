class Concert {
    public let image: String // Imagen del concierto (sólo lectura)
    public let name: String // Nombre del concierto (sólo lectura)
    // Media de reseñas (sólo lectura)
    private var _averageRating: Float?
    public var averageRating: Float? {
        get { return _averageRating }
    }
    
    init(image: String, name: String) {
        self.image = image
        self.name = name
    }
}
