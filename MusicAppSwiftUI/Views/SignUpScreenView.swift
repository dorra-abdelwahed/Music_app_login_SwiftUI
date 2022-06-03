//
//  SignUpScreenView.swift
//  OwnOffSwiftUI
//
//  Created by Dorra Ben Abdelwahed on 12/5/2022.
//

import SwiftUI

struct SignUpScreenView: View {
    
    @StateObject var viewModel = SignUpViewModel()
    @State var showPassword = false
    
    var body: some View {
        
        CustomNavBarContainer(title: "INSCRIPTION"){
        ZStack{
            Color.black
            .edgesIgnoringSafeArea(.all)
            
        VStack{
            
            Image("logo")
                .padding(.bottom,80)
            
            VStack{
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
                
            }
            
            
            //MARK: Password TextField
            
            VStack{
                
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
                .padding(.bottom,10)
            
            
            }
            
            VStack(alignment: .leading){
            
                HStack(alignment: .top){
                     
                Button {
                    viewModel.checkBoxSelected.toggle()
                } label: {
                    Image(systemName: viewModel.checkBoxSelected ? "checkmark.square": "square")
                        .foregroundColor(viewModel.checkBoxSelected ? Color("pink") : .white)
                }

                
                           
                Text("Je reconnais avoir lu et accepté les Coditions Générales d'Utilisation et la politique de Traitement et de Protection des Données à Caractère Personnel")
                    .foregroundColor(.gray)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                       
            }
            
            HStack(alignment: .top){

                Button {
                    viewModel.checkNewsletter.toggle()
                } label: {
                    Image(systemName: viewModel.checkNewsletter ? "checkmark.square": "square")
                        .foregroundColor(viewModel.checkNewsletter ? Color("pink") : .white)
                }

                Text("Je veux recevoir les dernières annonces et actualités par e-mail")
                    .foregroundColor(.gray)
                    .font(.caption)

            }
            }
            .padding()
            
            Button {
                
            } label: {
                
                Text("INSCRIPTION")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.black)
                    .background(self.viewModel.isValid ? Color.white : Color.gray.opacity(0.2))
                    .font(.body)
                    .padding(.horizontal)
            }
            .disabled(!viewModel.isValid)
            
            Spacer()
            
            HStack {

                Text("Déjà inscrit ? ")
                    .font(.callout)
                    .foregroundColor(.gray)

                NavigationLink {
                    SignInScreenView()
                } label: {

                    Text("Connectez-vous")
                        .foregroundColor(.white)
                        .font(.callout)

                }
            }
            .padding(.bottom, 30)

              

                
        }
        .padding()
       
        
        }
        .navigationBarHidden(true)
        
        
        
        }
    }
    }

struct SignUpScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreenView()
    }
}
