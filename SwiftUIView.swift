//
//  SwiftUIView.swift
//  Spaceship Clone
//
//  Created by Joseph Chung on 25/8/21.
//

import SwiftUI

struct SwiftUIView: View {
    
    @EnvironmentObject var UserviewModel: AppViewModel
    
    var body: some View {
        NavigationLink(
            destination: Main(),
            label: {
                /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
            })
            .onAppear() {
                UserviewModel.fetchData()
            }
        }
        
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
