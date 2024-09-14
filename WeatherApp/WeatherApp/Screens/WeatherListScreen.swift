//
//  WeatherListScreen.swift
//  WeatherApp
//
//  Created by Seymen Nadir Elmas on 14.09.2024.
//

import SwiftUI

enum Sheets : Identifiable {
    var id : UUID {
        return UUID()
    }
    case addNewCity
    case Settings
}

struct WeatherListScreen: View {
    @State private var isActiveSheet : Sheets?
    @EnvironmentObject var store : Store
    var body: some View {
        
        List {
            ForEach(store.weatherList, id: \.id) { weather in
                WeatherCell(weather: weather)
            }
            }
        .listStyle(PlainListStyle())
        .sheet(item: $isActiveSheet, content: { (item)  in
            switch item {
            case.addNewCity:
                AddCityScreen().environmentObject(store)
            case.Settings :
                SettingsScreen()
            }
        })
        
        .navigationBarItems(leading: Button(action: {
            isActiveSheet = .Settings
        }) {
            Image(systemName: "gearshape")
        }, trailing: Button(action: {
            isActiveSheet = .addNewCity
            
        }, label: {
            Image(systemName: "plus")
        }))
        .navigationTitle("Cities")
        .embedInNavigationView()
       
    }
}
#Preview {
    WeatherListScreen()
}

struct WeatherListScreen_Previews: PreviewProvider {
    static var previews: some View {
        return WeatherListScreen().environmentObject(Store())
    }
}

struct WeatherCell: View {
    
    let weather : WeatherViewModel
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Text(weather.city)
                    .fontWeight(.bold)
                HStack {
                    Image(systemName: "sunrise")
                    Text("\(weather.sunrise.formatAsString())")
                }
                HStack {
                    Image(systemName: "sunset")
                    Text("\(weather.sunset.formatAsString())")
                }
            }
            Spacer()
            
            
            Text("\(Int(weather.temperature)) K")
        }
        .padding()
        .background(Color(#colorLiteral(red: 0.9133135676, green: 0.9335765243, blue: 0.98070997, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))

    }
}
