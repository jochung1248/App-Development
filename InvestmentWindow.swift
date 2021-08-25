//
//  InvestmentWindow.swift
//  Spaceship Clone
//
//  Created by Joseph Chung on 31/7/21.
//

import SwiftUI

struct InvestmentWindow: View {
    @EnvironmentObject var UserviewModel: AppViewModel
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color(.init(displayP3Red: 0, green: 0.745, blue: 0.289, alpha: 1)))
                .frame(width: UIScreen.main.bounds.width - 25, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            HStack{
            VStack{
                HStack{
                    Text("Investment Balance")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                        .padding(.leading, 30)
                        .padding(.top)
                    
                    Spacer()
                }
            
                HStack{
                    Text("$\(UserviewModel.prodata[0].balance)")
                        .font(.system(size:30))
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.leading, 30)
                        .padding(.bottom, 5)
                    Spacer()
                }
                HStack{
                    VStack {
                    Text("Return")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                        .padding(.leading, 30)
                    Text("$\(Joseph.earnings, specifier: "%.2f")")
                        .font(.system(size:13))
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.leading, 30)
                        .padding(.bottom, 5)
                    
                    }
                    Spacer()
                        
                }
            
            }
                ZStack{
                    Circle()
                        .fill(Color(.init(displayP3Red: 0.39, green: 0.4, blue: 0.4, alpha: 0.4)))
                        .frame(width: 60, height: 60)
                        .padding(.trailing, 60)
                    Text("$")
                        .font(.system(size:35))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.trailing, 59)
                }
                    
            }
            
        }

    }
}

struct InvestmentWindow_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentWindow()
    }
}

