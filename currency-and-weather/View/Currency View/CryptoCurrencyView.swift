//
//  CryptoCurrencyView.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/24/21.
//
import Resolver
import SwiftUI

struct CryptoCurrencyView: View {
    @EnvironmentObject var store: Store
    
    @SwiftUI.Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    @State var cryptoCurrencys: [CryptoCurrency] = [CryptoCurrency]()
    @State var searchingName: String = ""
    
    private let objectManager: IObjectManager = Resolver.resolve()
    
    var backBtn : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack {
                Image(systemName: "chevron.backward")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.white)
                Text("Back")
                    .foregroundColor(Color.white)
            }
        })
        
    }
    
    var searchField : some View {
        SearchTextFieldView(placeholder: "Enter currency name", text: $searchingName)
            .onChange(of: searchingName, perform: {
                value in
                if value != "", self.cryptoCurrencys.filter({$0.name.contains(value)}).count>0 {
                    cryptoCurrencys = self.cryptoCurrencys.filter({$0.name.contains(value)})
                }
            })
            .padding(16)
            .background(Color.currencyback)
    }
    
    var cryptoList : some View {
        List {
            ForEach(self.store.crypto, id: \.id) {
                currency in
                HStack {
                    Text(currency.name)
                    Spacer()
                    Text(currency.priceUsd + " $")
                }
            }
            .foregroundColor(Color.black)
            .listRowBackground(Color.currencyback)
        }
        .foregroundColor(Color.textColor)
        .foregroundColor(Color.black)
    }
    
    var body: some View {
        VStack(spacing: 0) {
//            searchField
            cryptoList
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backBtn)
    }
}


