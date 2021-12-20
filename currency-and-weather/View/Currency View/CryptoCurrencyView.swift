//
//  CryptoCurrencyView.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/24/21.
//
import Resolver
import SwiftUI

struct CryptoCurrencyView: View {
    let url: String = "https://api.coincap.io/v2/assets"
    private let objectManager: IObjectManager = Resolver.resolve()
    
    @State var cryptoCurrencys: [CryptoCurrency] = [CryptoCurrency]()
    @State var searchingName: String = ""
    @SwiftUI.Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
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
        SearchTextFieldView(placeholder: "Enter currency name",text:$searchingName)
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
            ForEach(self.cryptoCurrencys, id: \.id) {
                cCurrency in
                Text(cCurrency.name)

            }
            .listRowBackground(Color.currencyback)
        }
        .foregroundColor(Color.textColor)
        .onAppear {
            self.objectManager.getObjectList(type: CryptoCurrency.self, url: url).then {
                let itemRequest = $0
                self.cryptoCurrencys.append(contentsOf: itemRequest.data)
            }
        }
        .background(Color.currencyback)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            searchField
            cryptoList
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backBtn)
    }
}


