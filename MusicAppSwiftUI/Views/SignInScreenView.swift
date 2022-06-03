//
//  SignInScreenView.swift
//  OwnOffSwiftUI
//
//  Created by Dorra Ben Abdelwahed on 12/5/2022.
//

import SwiftUI

struct SignInScreenView: View {
    
    @StateObject var viewModel = SignInViewModel()
    @State var showPassword = false
    
    
    var body: some View {
        
        CustomNavBarContainer(title: "SE CONNECTER"){
        
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
           
            
            VStack{
                
                Image("logo")
                    .padding(.bottom,80)
                
                
                //MARK: Email TextField
                TextField("Email", text: $viewModel.email)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.white)
                
                
                Divider()
                    .frame(height: 1)
                    .background(viewModel.showEmailError ? Color.red : Color.white.opacity(0.9))
                
                Text(viewModel.inlineEmailError)
                    .foregroundColor(.red)
                    .font(.system(size: 13, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom)
                
                //MARK: Password TextField
                HStack{
                    
                    SecureField("Mot de passe", text: $viewModel.password)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.white)
                    
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                            .padding([.bottom,.trailing],5)
                    }
                    
                    
                }
                
                Divider()
                    .frame(height: 1)
                    .background(viewModel.showPasswordError ? Color.red : Color.white.opacity(0.9))
                
                Text(viewModel.inlinePasswordError)
                    .foregroundColor(.red)
                    .font(.system(size: 13, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom,40)
                
                
                Button {
                      
                } label: {
                    
                    Text("SE CONNECTER")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.black)
                        .background(self.viewModel.isValid ? Color.white : Color.gray.opacity(0.2))
                        .font(.body)
                        .padding(.horizontal)
                }
                .disabled(!viewModel.isValid)
                
                NavigationLink {
                    
                } label: {
                    Text("Mot de passe oublié ?")
                        .foregroundColor(.white)
                        .font(.callout)
                        .padding()
                }
                
                HStack {
                    
                    Text("Pas encore inscrit ? ")
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                    NavigationLink {
                        SignUpScreenView()
                    } label: {
                        
                        Text("Inscrivez vous")
                            .foregroundColor(.white)
                            .font(.callout)
                        
                    }
                }
                .padding()
                
                
                
                
            }
            .padding()
            
            
        }
        .navigationBarHidden(true)
        }
        
    }
}

struct SignInScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreenView()
    }
}
