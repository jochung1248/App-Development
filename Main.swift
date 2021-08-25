//
//  Main.swift
//  Spaceship Clone
//
//  Created by Joseph Chung on 4/8/21.
//

import SwiftUI

struct Main: View {
    
    @EnvironmentObject var UserviewModel: AppViewModel
    
    var body: some View {
        TabView {
                Home()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                }
                PersonalGraph()
                    .tabItem {
                        Image(systemName: "dollarsign.circle.fill")
                        Text("My Portfolio")
                }
                AccountView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Account")
                }
                
        
        }
        .navigationBarHidden(true)

    }

}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
