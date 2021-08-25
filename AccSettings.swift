//
//  AccSettings.swift
//  Spaceship Clone
//
//  Created by Joseph Chung on 6/8/21.
//

import SwiftUI

struct AccSettings: View {
    
    @EnvironmentObject var UserviewModel: AppViewModel
    
    
    var body: some View {
        Button(action: {
            UserviewModel.signOut()
        }, label: {
            Text("Sign out")
                .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(15)
            Text(UserviewModel.prodata[0].firstname)
            

        })
        .navigationBarHidden(true)
        
    }

    
}

struct AccSettings_Previews: PreviewProvider {
    static var previews: some View {
        AccSettings()
    }
}
