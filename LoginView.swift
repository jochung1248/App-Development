//
//  LoginView.swift
//  Spaceship Clone
//
//  Created by Joseph Chung on 5/8/21.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {

    @EnvironmentObject var UserviewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            
            if UserviewModel.signedIn {
                SwiftUIView()
            } else {
                SignInView()
            }
            
            
            //.navigationTitle("Sign in")
        }
        .onAppear {
            UserviewModel.signedIn = UserviewModel.isSSignedIn
        }
    }
}


struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var UserviewModel: AppViewModel
    
    
    var body: some View {

        VStack {
            Image(systemName: "phone")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            VStack {
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                Button(action: {
                    
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    UserviewModel.signIn(email: email, password: password)
                }, label: {
                    Text("Sign In")
                        .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                })
                
                NavigationLink(
                    destination: SignUpView(),
                    label: {
                        Text("Create Account")
                    })
                    .padding()
                
            }
            .padding()
            Spacer()
        }
        .navigationTitle("Sign in")
        
    }
}

struct SignUpView: View {
    
    @State var email = ""
    @State var password = ""
    @State var firstname = ""
    @State var surname =  ""
    @State var balance = ""
    
    @EnvironmentObject var UserviewModel: AppViewModel
    
    
    var body: some View {

        VStack {
            Image(systemName: "phone")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            VStack {
                TextField("First Name", text: $firstname)
                    .disableAutocorrection(true)
                    .autocapitalization(.words)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                TextField("Surname", text: $surname)
                    .disableAutocorrection(true)
                    .autocapitalization(.words)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                TextField("Balance", text: $balance)
                    .disableAutocorrection(true)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                
                Button(action: {
                    
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    UserviewModel.signUp(email: email, password: password, firstname: firstname, surname: surname, balance: balance)
                    
                }, label: {
                    Text("Create Account")
                        .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                })
                
            }
            .padding()
            Spacer()
        }
        .navigationTitle("Create Account")
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AppViewModel())
    }
}
