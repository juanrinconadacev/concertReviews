import Foundation

class DataManager {
    static let concerts: [Concert] = [Concert(image: "eminem", band: "Eminem"),
                               Concert(image: "brucespringsteen", band: "Bruce Springsteen"),
                               Concert(image: "gunsnroses", band: "Guns 'n' Roses"),
                               Concert(image: "daftpunk", band: "Daft Punk")]
    
    static var selectedConcert: Int?
    
    static func save() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(concerts) {
            UserDefaults.standard.set(data, forKey: "concerts")
        } else {
            print("Error al guardar conciertos")
        }
    }
    
    static func load() {
        let data = UserDefaults.standard.object(forKey: "concerts")
        if data == nil {
            print("No hay datos guardados")
            save()
            return
        }
        let decoder = JSONDecoder()
        if let json = try? decoder.decode([Concert].self, from: data as! Data) {
            print(json)
        } else {
            print("Error al cargar")
        }
    }
}
