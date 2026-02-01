final class WeatherRepository {

    private let geo = GeoService()
    private let weather = WeatherService()
    private let cache = WeatherCache()

    func getWeather(city: String) async throws -> WeatherResponse {
        do {
            let loc = try await geo.fetchCity(city)
            let data = try await weather.fetchWeather(lat: loc.latitude, lon: loc.longitude)
            cache.save(data)
            return data
        } catch {
            if let cached = cache.load() {
                return cached
            }
            throw error
        }
    }
}
