//
//  AccountView.swift
//  Spaceship Clone
//
//  Created by Joseph Chung on 4/8/21.
//

import SwiftUI
import FirebaseFirestore
import Firebase
import FirebaseDatabase

struct AccountView: View {
    
    @EnvironmentObject var UserviewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            
           
            List {
                NavigationLink(destination: AccSettings()) {
                    Text("Account Settings")
                            .padding(5)
                    
                    
                }
                NavigationLink(destination: Text("Destination")) {
                        Text("Personal information")
                            .padding(5)
                    
                }
                NavigationLink(destination: Text("Destination")) {
                        Text("Transaction history")
                            .padding(5)
                }
                NavigationLink(destination: Text("Destination")) {
                        Text("Linked banked account")
                            .padding(5)
                }
                NavigationLink(destination: Text("Destination")) {
                        Text("Personal information")
                            .padding(5)
                }
                NavigationLink(destination: Text("Destination")) {
                        Text("Add investment")
                            .padding(5)
                    
                }
                NavigationLink(destination: Text("Destination")) {
                        Text("Withdraw funds")
                            .padding(5)
                }
                NavigationLink(destination: Text("Destination")) {
                        Text("Universe portfolio")
                            .padding(5)
                }
                
                
                
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle(UserviewModel.prodata[0].firstname)
            
            
        }


        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
