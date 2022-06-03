//
//  SignInViewModel.swift
//  OwnOffSwiftUI
//
//  Created by Dorra Ben Abdelwahed on 16/5/2022.
//

import SwiftUI
import Combine


class SignInViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var showEmailError = false
    @Published var showPasswordError = false
    
    @Published var inlineEmailError = ""
    @Published var inlinePasswordError = ""
    
    
    @Published var isValid = false
    
   
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    
    
    init(){
        
        
        validatedUsername
            .dropFirst()
            .receive(on: RunLoop.main)
            .map { emailCheck in
                switch emailCheck {
                case .empty:
                    self.showEmailError = true
                    return "L'email est obligatoire"
                case .notValid:
                    self.showEmailError = true
                    return "Votre email semble incorrect"
                default:
                    self.showEmailError = false
                    return ""
                }
            }
            .assign(to: \.inlineEmailError, on: self)
            .store(in: &cancellableSet)
        
        validatedPassword
            .dropFirst()
            .receive(on: RunLoop.main)
            .map { passwordCheck in
                switch passwordCheck {
                case .empty:
                    self.showPasswordError = true
                    return "Le mot de passe est obligatoire"
                case .notValid:
                    self.showPasswordError = true
                    return "Votre mot de passe doit contenir au moins 6 caractères dont des chiffres et lettres"
                default:
                    self.showPasswordError = false
                    return ""
                }
            }
            .assign(to: \.inlinePasswordError, on: self)
            .store(in: &cancellableSet)
        
        readyToSubmit
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableSet)
        
        
    }
    
    
    
    //MARK: Define our validation streams
    
    /// - return the username as a string if the username are good, and nil if the username is empty or bad.
    var validatedUsername: AnyPublisher<TextFieldCheck, Never> {
        
        //First, we access the Publisher using the $ symbol. Then we use the map operator to check if the entry met our validation or not. And finally, we use eraseToAnyPublisher to return the new publisher.
        return $email
            .map { name in
                
                guard !name.isEmpty else {
                    
                    return .empty
                }
                
                guard isValidEmail(testStr: name) else {
                    return .notValid
                }
                
                
                return .valid
            }
            .eraseToAnyPublisher()
    }
    
    /// - return the password as a string if the password are good, and nil if the password is empty or bad.
    var validatedPassword: AnyPublisher<TextFieldCheck, Never> {
        
        return $password
            .map { password in
                
                guard !password.isEmpty else {
                    return .empty
                }
                
                guard isPasswordLengthValid(testPass: password)  || isPasswordRegulier(testPass: password)  else {
                    return .notValid
                }
                
                return .valid
            }
            .eraseToAnyPublisher()
        
    }
    
    //MARK: Combining the results
    var readyToSubmit: AnyPublisher<Bool, Never> {
        
        return Publishers.CombineLatest(validatedUsername, validatedPassword)
            .map { name, pass in
                
                return name == .valid && pass == .valid
            }
            .eraseToAnyPublisher()
    }
    
    
   
}


