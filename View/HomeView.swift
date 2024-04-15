//
//  HomeView.swift
//  Networking_l1
//
//  Created by Круглич Влад on 13.04.24.
//

import Foundation
import SwiftUI

struct HomeView : View {
    @ObservedObject var vm = ViewModel()
    var body: some View {
        if (vm.data == nil) {
            Text("LOADING...")
        }
        else {
            VStack {
                VStack {
                    VStack {
                        Text("Currency Converter")
                            .font(.custom("Roboto-Bold", size: 25))
                            .foregroundStyle(Color.blueColor)
                        ZStack {
                            VStack {
                                HStack {
                                    Text("Amount")
                                        .font(.custom("Roboto-Regular", size: 15))
                                        .foregroundStyle(.gray)
                                        .padding(.top, 20)
                                    Spacer()
                                }
                                HStack {
                                    HStack {
                                        Circle()
                                            .fill(.green)
                                            .frame(width: 45)
                                        Text(vm.amount.first?.key ?? "")
                                            .font(.custom("Roboto-Medium", size: 20))
                                            .foregroundStyle(Color.blueColor)
                                        Menu {
                                            if let data = vm.data?.Valute {
                                                ForEach(data.keys.sorted(), id: \.self) { key in
                                                    if let valuteItem = data[key] {
                                                        Button(action: {
                                                            print(key)
                                                            vm.amount[key] = valuteItem
                                                            print(vm.amount)
                                                        }) {
                                                            Text("\(key)")
                                                        }
                                                    }
                                                }
                                            }
                                        } label: {
                                            Image(systemName: "chevron.down")
                                                .foregroundColor(.black)
                                        }
                                        
                                        Spacer()
                                    }
                                    ZStack {
                                        Rectangle()
                                            .fill(Color.grayColor)
                                            .frame(width: 120, height: 45)
                                            .cornerRadius(10)
                                        TextField("100", text: $vm.count)
                                            .padding(.leading, 10)
                                            .frame(width: 100)
                                    }
                                }
                                ZStack {
                                    Rectangle()
                                        .fill(Color.grayColor)
                                        .frame(height: 3)
                                    Circle()
                                        .fill(Color.blueColor)
                                        .frame(width: 45)
                                    Image(systemName: "arrow.triangle.2.circlepath")
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                }
                                HStack {
                                    Text("Converted Amount")
                                        .font(.custom("Roboto-Regular", size: 15))
                                        .foregroundStyle(.gray)
                                        .padding(.top, 20)
                                    Spacer()
                                }
                                HStack {
                                    HStack {
                                        Circle()
                                            .fill(.green)
                                            .frame(width: 45)
                                        Text(vm.convertedAmount.first?.key ?? "")
                                            .font(.custom("Roboto-Medium", size: 20))
                                            .foregroundStyle(Color.blueColor)
                                        Menu {
                                            if let data = vm.data?.Valute {
                                                ForEach(data.keys.sorted(), id: \.self) { key in
                                                    if let valuteItem = data[key] {
                                                        Button(action: {
                                                            print(key)
                                                            vm.convertedAmount[key] = valuteItem
                                                            print(vm.convertedAmount)
                                                        }) {
                                                            Text("\(key)")
                                                        }
                                                    }
                                                }
                                            }
                                        } label: {
                                            Image(systemName: "chevron.down")
                                                .foregroundColor(.black)
                                        }

                                        Spacer()
                                    }
                                    ZStack {
                                        Rectangle()
                                            .fill(Color.grayColor)
                                            .frame(width: 120, height: 45)
                                            .cornerRadius(10)
                                        HStack {
                                            Text(vm.changeValue)
                                                .frame(width: 100)
                                                .padding(.leading,5)
                                                .font(.custom("Roboto-Regular", size: 15))
                                            Spacer()
                                        }
                                    }
                                }
                                Button(action: {
                                    vm.changeValue = vm.change()
                                }) {
                                    Text("Change")
                                        .foregroundStyle(.white)
                                        .frame(width: 260, height: 50)
                                        .background(Color.blueColor)
                                        .cornerRadius(10)
                                }
                                .padding(.top, 30)
                            }
                        }
                        Spacer()
                    }
                    .padding(30)
                }
                .frame(width: 320, height: 470)
                .background(Color.white)
                .cornerRadius(20)
                .padding(30)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.grayColor)
        }
    }
}


#Preview {
    HomeView()
}
