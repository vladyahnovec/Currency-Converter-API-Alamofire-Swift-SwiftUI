//
//  ViewModel.swift
//  Networking_l1
//
//  Created by Круглич Влад on 13.04.24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var data: DecodableType?
    @Published var amount: [String: ValuteItems] = [:]
    @Published var convertedAmount: [String: ValuteItems] = [:]
    
    @Published var changeValue = ""
    
    @Published var count = "0"

    init() {
        NetworkingManager.shared.fetchData { result in
            switch result {
            case .success(let success):
                print(success)
                self.data = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func change() -> String {
          guard let amountValue = amount.first?.value.value,
                let amountNominal = amount.first?.value.nominal,
                let convertedAmountValue = convertedAmount.first?.value.value,
                let countValue = Double(count),
                let convertedAmountNominal = convertedAmount.first?.value.nominal else {
              return "Нет данных"
          }

          let result = ((amountValue / Double(amountNominal)) * countValue) / (convertedAmountValue / Double(convertedAmountNominal))
          return String(String(result).prefix(6))
      }
  }

