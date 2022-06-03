//
//  CustomNavBarContainer.swift
//  OwnOffSwiftUI
//
//  Created by Dorra Ben Abdelwahed on 20/5/2022.
//

import SwiftUI

struct CustomNavBarContainer<Content: View>: View {
    
    let content: Content
    let title: String
    
    init(title: String, @ViewBuilder content: () -> Content){
        self.content = content()
        self.title = title
    }
    
    var body: some View {
        VStack(spacing:0) {
            CustomNavBarView(title: title)
       
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct CustomNavBarContainer_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainer(title: "SE CONNECTER"){
            ZStack{
                Color.green.ignoresSafeArea()
                
                Text("Hello World")
                    .foregroundColor(.white)
            }
        }
    }
}
