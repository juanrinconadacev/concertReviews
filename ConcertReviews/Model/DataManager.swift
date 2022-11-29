import Foundation

class DataManager {
    static var concerts: [Concert] = [Concert(image: "eminem", band: "Eminem"),
                               Concert(image: "brucespringsteen", band: "Bruce Springsteen"),
                               Concert(image: "gunsnroses", band: "Guns 'n' Roses"),
                               Concert(image: "daftpunk", band: "Daft Punk")]
    
    static var selectedConcert: Int?
    
    private static var user: User?
    
    static func saveConcerts() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(concerts) {
            UserDefaults.standard.set(data, forKey: "concerts")
        } else {
            print("Error al guardar conciertos")
        }
    }
    
    static func loadConcerts() {
        let data = UserDefaults.standard.object(forKey: "concerts")
        if data == nil { // La primera vez guarda los 4 conciertos sin reseñas
            print("No hay datos guardados")
            saveConcerts()
            return
        }
        let decoder = JSONDecoder()
        if let json = try? decoder.decode([Concert].self, from: data as! Data) {
            concerts = json
        } else {
            print("Error al cargar conciertos")
        }
    }
    
    static func saveUser() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(user) {
            UserDefaults.standard.set(data, forKey: "user")
        } else {
            print("Error al guardar datos de usuario")
        }
    }
    
    static func loadUser() -> User? {
        let data = UserDefaults.standard.object(forKey: "user")
        if data == nil {
            print("No hay datos de usuario")
            return nil
        }
        let decoder = JSONDecoder()
        if let json = try? decoder.decode(User.self, from: data as! Data) {
            user = json
            return user
        } else {
            print("Error al cargar datos de usuario")
            return nil
        }
    }
    
    static func getUsuario() -> User? { 
        if user == nil {
            user = loadUser()
            if user == nil {
                user = User()
                user?.reviews = []
                return user
            }
        }
        return user
    }
}
