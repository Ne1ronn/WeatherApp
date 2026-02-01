import Foundation
import Combine

@MainActor
final class WeatherViewModel: ObservableObject {

    @Published var weather: WeatherResponse?
    @Published var error: String?
    @Published var isLoading = false
    @Published var isOffline = false

    private let repo = WeatherRepository()

    func search(city: String) {
        guard !city.isEmpty else {
            self.error = "Empty input"
            return
        }

        Task {
            self.isLoading = true
            self.error = nil

            do {
                self.weather = try await repo.getWeather(city: city)
                self.isOffline = false
            } catch {
                self.error = "City not found / Network error"
                self.isOffline = true
            }

            self.isLoading = false
        }
    }
}
