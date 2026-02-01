struct GeoResponse: Codable {
    let results: [GeoResult]
}

struct GeoResult: Codable {
    let latitude: Double
    let longitude: Double
    let name: String
}
