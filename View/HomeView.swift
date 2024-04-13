//
//  HomeView.swift
//  Networking_l1
//
//  Created by Круглич Влад on 13.04.24.
//

import Foundation
import SwiftUI

struct HomeView : View {
    var body: some View {
        VStack {
            VStack {
                VStack {
                   // MARK:
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
                                    Text("SGD")
                                        .font(.custom("Roboto-Medium", size: 20))
                                        .foregroundStyle(Color.blueColor)
                                    Image(systemName: "chevron.down")
                                    Spacer()
                                }
                                ZStack {
                                    Rectangle()
                                        .fill(Color.grayColor)
                                        .frame(width: 120, height: 45)
                                        .cornerRadius(10)
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
                                    Text("USD")
                                        .font(.custom("Roboto-Medium", size: 20))
                                        .foregroundStyle(Color.blueColor)
                                    Image(systemName: "chevron.down")
                                    Spacer()
                                }
                                ZStack {
                                    Rectangle()
                                        .fill(Color.grayColor)
                                        .frame(width: 120, height: 45)
                                        .cornerRadius(10)
                                }
                            }
                            Button(action: {
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
        .onAppear() {
            print("test123")
            NetworkingManager.shared.fetchData { result in
                switch result {
                case .success(let success):
                    print(success.Valute["AZN"]?.name)
                case .failure(let failure):
                    print(failure)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color.grayColor)
    }
    
}


#Preview {
    HomeView()
}
