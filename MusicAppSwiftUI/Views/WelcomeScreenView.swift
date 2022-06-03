//
//  WelcomeScreenView.swift
//  OwnOffSwiftUI
//
//  Created by Dorra Ben Abdelwahed on 12/5/2022.
//

import SwiftUI

struct WelcomeScreenView: View {
    
    
    var body: some View {
        
        NavigationView{
        ZStack{
            
            Color.black
            .edgesIgnoringSafeArea(.all)
            
        VStack{
            
            Image("logo")
            
            Spacer()
            
            NavigationLink {
                SignUpScreenView()
            } label: {
                
                Text("INSCRIPTION")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .font(.body)
                    .padding()
                    
            }
            
            NavigationLink {
                SignInScreenView()
            } label: {
                
                Text("SE CONNECTER")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(Color.gray.opacity(0.2))
                    .font(.body)
                    .padding(.horizontal)
                    
            }
            .padding(.bottom,50)
           

            
            
        }
        }
        }
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}
