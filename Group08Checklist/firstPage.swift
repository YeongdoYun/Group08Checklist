import SwiftUI
import CoreLocationUI
struct FirstView: View {
    var openWeatherResponse: OpenWeatherResponse
    
    private let iconList = [
        "Clear": "☀️",
        "Clouds": "☁️",
        "Mist": "☁️",
        "": "?",
        "Drizzle": "🌧",
        "Thunderstorm": "⛈",
        "Rain": "🌧",
        "Snow": "🌨"
    ]
    
    @State private var isAAASelected = false
    @State private var isBBBSelected = false
    @State private var isCCCSelected = false
    @State private var isDDDSelected = false
    @State private var isEEESelected = false
    
    @State private var isRRRSelected = false
    @State private var isVVVSelected = false
    @State private var isFFFSelected = false
    @State private var isOOOSelected = false
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Today's Weather")
                                    .bold()
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.black)) {
                    VStack {
                        Spacer()
                        Text(Weather(response: openWeatherResponse).location)
                            .font(.largeTitle)
                            .padding()
                        Text(Weather(response: openWeatherResponse).temperature).font(.system(size: 75)).bold().padding()
//                        Text("\(Weather(response: openWeatherResponse).tempt)").font(.system(size: 75)).bold().padding()
                        VStack {
                            Text("Apparent temperature")
                                .font(.system(size: 25))
                                .padding(.bottom, 4)
//                            Text(Weather(response: openWeatherResponse).apparent_temp).font(.system(size: 30)).padding(.bottom, 8)
                            Text("\(Weather(response: openWeatherResponse).tempt)").font(.system(size: 30)).padding(.bottom, 8)
                        }
                        Text(iconList[Weather(response: openWeatherResponse).main] ?? "").font(.custom("SFProDisplay-Bold", size: 75)).padding().font(.custom("SFProDisplay-Bold", size: 75))
//                        Text(iconList["Rain"] ?? "").font(.custom("SFProDisplay-Bold", size: 75)).padding().font(.custom("SFProDisplay-Bold", size: 75))
                        Text(Weather(response: openWeatherResponse).description).font(.largeTitle).padding()
//                        Text("moderate rain").font(.largeTitle).padding()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                Section(header: Text("Responsible Work")
                                    .bold()
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.black)) {
                    VStack {
                        Toggle("Earthworks", isOn: $isAAASelected)
                        Toggle("Welding & Cutting", isOn: $isBBBSelected)
                        Toggle("Factory Construction, Demolition, Renovation, Refair Works", isOn: $isCCCSelected)
                        Toggle("Scaffolding Works", isOn: $isDDDSelected)
                        Toggle("Pipeline Construction", isOn: $isEEESelected)
            
                        Spacer()
                    }
                }
                
                Section(header: Text("Equipment Used")
                                    .bold()
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.black)) {
                    VStack {
                        Toggle("Mobile Crane", isOn: $isRRRSelected)
                        Toggle("Excavator", isOn: $isVVVSelected)
                        Toggle("A Dump/Freight Truck", isOn: $isFFFSelected)
                        Toggle("Elevated Workstation", isOn: $isOOOSelected)
            
                        Spacer()
                    }
                }
                
                Section {
                    NavigationLink(destination: ChecklistView(openWeatherResponse: openWeatherResponse, isAAASelected: isAAASelected, isBBBSelected: isBBBSelected, isCCCSelected: isCCCSelected, isDDDSelected: isDDDSelected, isEEESelected: isEEESelected, isRRRSelected: isRRRSelected, isVVVSelected: isVVVSelected, isFFFSelected: isFFFSelected, isOOOSelected: isOOOSelected)) {
                        Text("Go to List")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}


