//
//  ContentView.swift
//  Spaceship Clone
//
//  Created by Joseph Chung on 31/7/21.
//

import SwiftUI

struct Home: View {
    //@State private var price: [CGFloat] = [CGFloat()]
    //@ObservedObject private var viewModel = ContactViewModel()
    
    
    var body: some View {
        /*
        NavigationView {
            List(viewModel.unidata) { data in
                           VStack(alignment: .leading) {
                               Text("\(data.price)")
                           }
                       }.onAppear() {
                           self.viewModel.fetchData()
                       }
                }
        */
        
        
            ScrollView{
                VStack {
                    Text("Welcome to NEZ")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size:20))
                        .padding()
                    
                    NavigationLink(
                        destination: PersonalGraph()) {
                        InvestmentWindow()
                        
                    }
                    .padding(.bottom, 15)
                    UniverseGraph()
                    
                    
                       
                }
                Spacer()
            }
            .navigationBarHidden(true)
            .navigationBarTitle(Text("Home"))
            //.background(Color(.white))
            //.edgesIgnoringSafeArea([.top, .bottom])
        /*
        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(Color(.init(displayP3Red: 0.75, green: 0.75, blue: 0.75, alpha: 1)))
                    .frame(width: UIScreen.main.bounds.width, height: 80, alignment: .center)
                    .padding(.top, UIScreen.main.bounds.height - 80)
                    )
        
        .overlay(
            
            HStack{
            NavigationLink(
                destination: ContentView()) {
                Circle()
                    .fill(Color.black)
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(.top, UIScreen.main.bounds.height - 80)
                    .padding(.leading, 20)
            }
            
            Spacer()
            
            NavigationLink(
                destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                label: {
                
                
                Circle()
                    .fill(Color.black)
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(.top, UIScreen.main.bounds.height - 80)
            })
            
            Spacer()
            
            NavigationLink(
                destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                label: {
                Circle()
                    .fill(Color.black)
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(.top, UIScreen.main.bounds.height - 80)
            })
            
            Spacer()
            
            NavigationLink(
                destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                label: {
                Circle()
                    .fill(Color.black)
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(.top, UIScreen.main.bounds.height - 80)
                    .padding(.trailing, 20)
            })
            
            })
            */
            
            
        
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea([.top, .bottom])
        
        
        
    }
 
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

