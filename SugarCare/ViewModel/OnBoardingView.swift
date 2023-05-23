//
//  OnBoardingView.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        VStack {
            Text("Sugar Care")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Image("Liver/0")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(50)
            
            Spacer()
            
            Text("An app that help you track your sugar intake by setting the recommended sugar intake from AHA (American Heart Association) and the intake limit according US Dietary Guidelines")
                .font(.body)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Text("Maximize app functionallity by connecting to HealthKit")
                .font(.caption2)
                .padding(.bottom)
            
            Button("Authorize HealthKit") {
                
            }
            .padding()
            .padding(.horizontal)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(18)
        }
        .padding(.all, 50)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
