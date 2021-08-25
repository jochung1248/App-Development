//
//  PersonalGraph.swift
//  Spaceship Clone
//
//  Created by Joseph Chung on 31/7/21.
//

import SwiftUI


struct PersonalGraph: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var viewModel = UniverseViewModel()
    @ObservedObject var UserviewModel = AppViewModel()
    

    
    var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left") // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                    //Text("Go back")
                }
            }
        }
    
    func priceArray(prices: [UniverseData]) -> [CGFloat] {
        
        var a = [CGFloat](arrayLiteral: 0.1)
        
        
        for element in prices {
            a.append(element.price)
        }
        
        return a
        
    }
    
    func lastPrice(array: [CGFloat]) -> CGFloat {
        var last = CGFloat()
        
        for element in array {
            last = element
        }
        
        return last
    }
    
    func dateArray(dates: [UniverseData]) -> [Date] {
        
        var b = [Date](arrayLiteral: Date())
        
        
        
        for element in dates {
            b.append(element.date)
        }
        
        return b
        
    }
    
    
    func percentage(sa: [CGFloat]) -> CGFloat {
        let start = sa.first
        let final = sa.last
        
        return ((CGFloat(final!) - CGFloat(start!)) / CGFloat(start!))
    }
    
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text("My Portfolio")
                        .font(.title)
                        .padding(.leading, 20)
                    
                    Spacer()
                    Text("$\(Joseph.balance, specifier: "%.2f")")
                        .font(.title)
                        .padding(.trailing, 20)
                }
                //.padding(.top, 10)
                
                HStack{
                    Text("\(Joseph.earnings, specifier: "%.2f")(2.4%)")
                        .padding(.leading, 20)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.bottom, 30)
    
                //Spacer()
                LineGraph(dataPoints: priceArray(prices: viewModel.unidata).normalized)
                    .stroke(Color.green, lineWidth: 4)
                    .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height - 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white)
                            .overlay(HStack {
                                Text("\(DateFormatter.displayDate.string(from: dateArray(dates: viewModel.unidata)[0]))")
                                        .font(.caption2)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .padding(.top, 370)
                                        .padding(.trailing, 280)
                                
                                })
                
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(Color(.init(displayP3Red: 0, green: 0.345, blue: 0.189, alpha: 1)))
                    .frame(width: UIScreen.main.bounds.width - 25, height: 50, alignment: .center)
                    .overlay(HStack {
                        Button(action: {}, label: {
                            Text("1M")
                                .font(.system(size: 12))
                                .padding(.leading, 25)
                                .foregroundColor(.white)
                        })
                        
                        Spacer()
                        Button(action: {}, label: {
                            Text("3M")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                        })
                        
                        Spacer()
                        Button(action: {}, label: {
                            Text("6M")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                        })
                        
                        Spacer()
                        Button(action: {}, label: {
                            Text("1Y")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                        })
                        
                        Spacer()
                        Button(action: {}, label: {
                            Text("ALL TIME")
                                .font(.system(size: 12))
                                .padding(.trailing, 25)
                                .foregroundColor(.white)
                        }
                        
                        )
                        
                        })
                
                HStack{
                    VStack{
                        
                            Circle()
                                .fill(Color(.init(displayP3Red: 0, green: 0.745, blue: 0.289, alpha: 1)))
                                .frame(width: 70, height: 70, alignment: .center)
                                .overlay(Image(systemName: "arrow.right.arrow.left")
                                            .foregroundColor(.white))
                            
                            
                        
                        Text("Invest")
                            
                    }
                    .padding(.leading, 70)
                    .padding(.bottom, 20)
                    
                    Spacer()
                    
                    VStack{
                        
                        Circle()
                            .fill(Color(.init(displayP3Red: 0, green: 0.745, blue: 0.289, alpha: 1)))
                            .frame(width: 70, height: 70, alignment: .center)
                            .overlay(Image(systemName: "arrowtriangle.up.fill")
                                        .foregroundColor(.white))
                        
                        Text("Universe")
                            
                    }
                    .padding(.trailing, 70)
                    .padding(.bottom, 20)
                }
                
        
                
        }
        .onAppear() {
            viewModel.fetchData()
        }
        
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(false)
        .navigationBarItems(leading: btnBack)
        
        
        }
        //.edgesIgnoringSafeArea([.top, .bottom])
            
    }
}



struct PersonalGraph_Previews: PreviewProvider {
    static var previews: some View {
        PersonalGraph()
    }
}
