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
    @State private var currencyView: Bool = false;
    @State private var weatherView: Bool = false;
    
    private let background = Gradient(colors: [.currencyback,.weatherback])
    
    var header : some View {
        VStack {
            Text("Currency's & Weather")
                .foregroundColor(Color.primary)
                .font(.title)
        }
    }
    
    var currencyes :some View {
        VStack {
            Spacer()
            Button(action: {
                self.currencyView = true;
            }, label: {
                Text("Currency's")
            })
            Spacer()
        }
        .padding(32)
        .modifier(RoundedViewWrapper())
    }
    
    var weather : some View {
        VStack {
            Spacer()
            Button(action: {
                self.weatherView = true;
            }, label: {
                Text("Weather")
            })
            Spacer()
        }
        .padding(32)
        .modifier(RoundedViewWrapper())
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Spacer()
                self.currencyes
                Spacer()
                self.weather
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(32)
            .navigationBarTitle(Text("Currency's and Weather")
                                    .font(.largeTitle),
                                displayMode: .inline)
            .background(LinearGradient(gradient: self.background, startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.bottom))
        }
    }
}

