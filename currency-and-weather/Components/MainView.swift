//
//  ContentView.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/11/21.
//

import SwiftUI
import Resolver

struct MainView: View {
    private let objectManager: IObjectManager = Resolver.resolve();
    @State var cryptoCurrencys: [CryptoCurrency] = [CryptoCurrency]()
    
    var currencyes :some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                NavigationLink("Currency's", destination: EmptyView())
                    .foregroundColor(Color.textColor)
                    .font(.title2)
                Spacer()
            }
            Spacer()
        }
        .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.textColor
                                .opacity(0.3),lineWidth: 3)
                    .padding(.horizontal,12))
    }
    
    var weather : some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                NavigationLink("Weather",destination: EmptyView())
                    .foregroundColor(Color.textWeatherColor)
                    .font(.title2)
                Spacer()
            }
            Spacer()
        }
        .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.textWeatherColor
                                .opacity(0.3),lineWidth: 3)
                    .padding(.horizontal,12))
       
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                self.currencyes
                self.weather
            }
            .padding(32)
            .background(LinearGradient(gradient: Gradient(colors: [.currencyback,.purple,.weatherback]), startPoint: .top, endPoint: .bottom) )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
