//
//  AddSugarView.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 24/05/23.
//

import SwiftUI
import SpriteKit

struct AddSugarPage: View {
    let userHealthViewModel: UserHealthViewModel
    let addSugarViewController: AddSugarViewController
    let scene: SugarContainerScene
    @State var addedSugar: Int = 1
    
    var body: some View {
        VStack {
            SpriteView(scene: scene)
                .cornerRadius(18)
                .padding()
            
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
    
}

struct AddSugarView_Previews: PreviewProvider {
    static var previews: some View {
        AddSugarPage(userHealthViewModel: UserHealthViewModel.shared, addSugarViewController: AddSugarViewController(sugarOrigin: "Drink"), scene: SugarContainerScene(1, nodeType: "Drink"))
    }
}
