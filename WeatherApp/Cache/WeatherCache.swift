import Foundation

final class WeatherCache {

    private let key = "cached_weather"

    func save(_ weather: WeatherResponse) {
        let data = try? JSONEncoder().encode(weather)
        UserDefaults.standard.set(data, forKey: key)
    }

    func load() -> WeatherResponse? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(WeatherResponse.self, from: data)
    }
}
