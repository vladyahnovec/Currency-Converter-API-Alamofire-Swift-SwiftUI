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
                let convertedAmountNominal = convertedAmount.first?.value.nominal else {
              return "Нет данных для конвертации"
          }

          let result = (amountValue / Double(amountNominal)) / (convertedAmountValue / Double(convertedAmountNominal))
          return String(String(result).prefix(4))
      }
  }

