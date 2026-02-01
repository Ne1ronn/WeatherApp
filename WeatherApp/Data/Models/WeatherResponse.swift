struct WeatherResponse: Codable {
    let current_weather: CurrentWeather
    let daily: DailyWeather
}

struct CurrentWeather: Codable {
    let temperature: Double
    let windspeed: Double
    let time: String
}

struct DailyWeather: Codable {
    let temperature_2m_max: [Double]
    let temperature_2m_min: [Double]
}
