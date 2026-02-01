import SwiftUI

struct WeatherView: View {

    @StateObject private var vm = WeatherViewModel()
    @State private var city = ""

    var body: some View {
        VStack(spacing: 16) {

            TextField("City", text: $city)
                .textFieldStyle(.roundedBorder)

            Button("Search") {
                vm.search(city: city)
            }

            if vm.isLoading {
                ProgressView()
            }

            if let weather = vm.weather {
                Text("Temperature: \(weather.current_weather.temperature)°C")
                Text("Wind: \(weather.current_weather.windspeed) m/s")

                if vm.isOffline {
                    Text("Offline data")
                        .foregroundColor(.red)
                }
            }

            if let error = vm.error {
                Text(error).foregroundColor(.red)
            }
        }
        .padding()
    }
}
