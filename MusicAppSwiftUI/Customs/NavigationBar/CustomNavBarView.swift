//
//  AppNavBarView.swift
//  OwnOffSwiftUI
//
//  Created by Dorra Ben Abdelwahed on 18/5/2022.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let title: String
    
    var body: some View {
     
          
                HStack{
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.title2)
                    }

                    Spacer()

                    
                    Text(title)
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                      
                    Spacer()
                        
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.left")
                            .opacity(0)
                    }
                        
                    
               
                }
                .padding()
                .font(.headline)
                .background(
                    Color.black.edgesIgnoringSafeArea(.top)
                )
        
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarView(title: "SE CONNECTER")
    }
}
