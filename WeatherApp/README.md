# WeatherApp

Simple iOS weather app built with **SwiftUI**.

---

## Platform
- iOS
- SwiftUI

---

## API
**Open-Meteo** (no API key)

- Geocoding: city → coordinates  
- Weather: current weather + daily min/max

---

## Features
- Search weather by city name
- Current temperature and wind
- Daily min / max temperature
- Offline mode (last successful data)
- Error handling (empty input, city not found, no network)

---

## Architecture
MVVM + Repository  
- Networking: URLSession  
- JSON parsing: Codable  
- Cache: UserDefaults  

---

## Offline Mode
Last successful response is saved locally.  
If there is no internet connection, cached data is shown with an **“Offline data”** label.

---

## How to Run
1. Open project in Xcode
2. Select an iOS Simulator
3. Press Run
4. Enter a city name (e.g. `Astana`, `London`)

---
