//
//  AddSugarView.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 24/05/23.
//

import SwiftUI
import SpriteKit

struct AddSugarView: View {
    let userHealthViewModel: UserHealthViewModel
    let addSugarViewController: AddSugarViewController
    @State var addedSugar: Int = 1
    
    let scene = SugarContainerScene(1)
    
    var body: some View {
        VStack {
            SpriteView(scene: scene)
                .cornerRadius(18)
                .padding()
            
//            Spacer()
            
            HStack {
                Spacer()
                
                Button {
                    if addedSugar > 1 {
                        self.addedSugar -= 1
                        scene.substractSugar()
                    }
                } label: {
                    Text("-")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.all, 20)
                .font(.title)
                .background(.blue)
                .foregroundColor(.white)
                .mask(Circle())
                
                Spacer()
                
                Text("\(addedSugar) g")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    self.addedSugar += 1
                    scene.addNewSugar()
                } label: {
                    Text("+")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .padding(.all, 20)
                .font(.title)
                .background(.blue)
                .foregroundColor(.white)
                .mask(Circle())
                
                Spacer()
            }
            .padding()
            
            Button {
                userHealthViewModel.saveSugarSample(dietarySugar: Double(addedSugar))
                userHealthViewModel.getSugarData()
                addSugarViewController.navigateBack()
            } label: {
                Text("Save")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            .padding()
        }
        .padding()
    }
    
    func updateScene() {
        
    }
}

struct AddSugarView_Previews: PreviewProvider {
    static var previews: some View {
        AddSugarView(userHealthViewModel: UserHealthViewModel.shared, addSugarViewController: AddSugarViewController(sugarOrigin: "Drink"))
    }
}
