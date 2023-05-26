//
//  MainView.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import SwiftUI
import SpriteKit

struct MainView: View {
    let userHealthViewModel: UserHealthViewModel
    let mainViewController: MainViewController
    let scene: SugarContainerScene
    
    var body: some View {
        let sugarGrams = userHealthViewModel.sugarGrams
        let recomendSugar = Int(userHealthViewModel.recomendSugar)
        let sugarLimit = userHealthViewModel.limitSugarGrams
        
        VStack {
            HStack {
                if sugarGrams < recomendSugar {
                    Image("Liver/0")
                    Text("Your sugar intake for today is \(String(sugarGrams)) grams")
                        .padding()
                }
                else if sugarGrams > recomendSugar && sugarGrams < sugarLimit {
                    Image("Liver/1")
                    Text("Your sugar intake for today is \(String(sugarGrams)) grams, i am already full")
                        .padding()
                }
                else {
                    Image("Liver/2")
                    Text("Your sugar intake for today is \(String(sugarGrams)) grams, PLEASE STOP!")
                        .padding()
                }
            }
            
            SpriteView(scene: scene)
                .cornerRadius(18)
                .padding()
            
//                Image("Sugar1")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .mask(
//                        Rectangle()
//                            .offset(x: 0, y: 10)
//                            .aspectRatio(contentMode: .fit)
//                    )
//                    .background{
//                        Image("Sugar1")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .grayscale(10)
//                    }
            
            HStack {
                Button(action: {
                    mainViewController.navigateToSnack()
                }, label: {
                    VStack {
                        Image("Snack/1")
                            .resizable()
                            .frame(width: 60, height: 60)
                        Text("Add Snack")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color("PastelGreen"))
                    .cornerRadius(18)
                })
                
                Spacer()
                
                Button {
                    mainViewController.navigateToDrink()
                } label: {
                    VStack {
                        Image("Drink/1")
                            .resizable()
                            .frame(width: 60, height: 60)
                        Text("Add Drink")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .background(Color("PastelBlue"))
                .cornerRadius(18)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(userHealthViewModel: UserHealthViewModel(), mainViewController: MainViewController(), scene: SugarContainerScene(1, nodeType: "Sugar"))
    }
}
