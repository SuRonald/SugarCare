//
//  MainView.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import SwiftUI
import SpriteKit

struct MainView: View {
    let mainViewController: MainViewController
    
    var scene: SKScene {
        let scene = SugarContainer()
        scene.size = CGSize(width: 350, height: 450)
        scene.scaleMode = .fill
        scene.backgroundColor = UIColor(named: "PastelGray")!
        scene.sugarCubes = 8
        return scene
    }

    var body: some View {
        VStack {
            HStack {
                Image("Liver/0")
                Text("Your sugar intake for today is 50 grams")
                    .padding()
                    .cornerRadius(18)
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
                        Image("Snack")
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
                        Image("Drink")
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
        MainView(mainViewController: MainViewController())
    }
}
