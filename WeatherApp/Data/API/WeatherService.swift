import Foundation

final class WeatherService {

    func fetchWeather(lat: Double, lon: Double) async throws -> WeatherResponse {
        let url = URL(string:
          "https://api.open-meteo.com/v1/forecast?latitude=\(lat)&longitude=\(lon)&current_weather=true&daily=temperature_2m_max,temperature_2m_min&timezone=auto"
        )!

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(WeatherResponse.self, from: data)
    }
}
