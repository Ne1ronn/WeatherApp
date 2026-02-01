import Foundation

final class GeoService {

    func fetchCity(_ name: String) async throws -> GeoResult {
        let url = URL(string:
          "https://geocoding-api.open-meteo.com/v1/search?name=\(name)&count=1"
        )!

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(GeoResponse.self, from: data)

        guard let city = response.results.first else {
            throw URLError(.badServerResponse)
        }
        return city
    }
}
