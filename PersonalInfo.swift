//
//  PersonalInfo.swift
//  Spaceship Clone
//
//  Created by Joseph Chung on 5/8/21.
//

import SwiftUI

struct PersonalInfo: View {

    var body: some View {
        VStack{
            Circle()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .overlay(Text("\(Joseph.name)")
                            .foregroundColor(.white))
        List {
            Text("\(Joseph.name)")
            Text("\(Joseph.id)")
            Text("Email...")
        }
        }
    }
}

struct PersonalInfo_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfo()
    }
}
