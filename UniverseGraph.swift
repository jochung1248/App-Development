//
//  UniverseGraph.swift
//  Spaceship Clone
//
//  Created by Joseph Chung on 31/7/21.
//

import SwiftUI


struct LineGraph: Shape {
    var dataPoints: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        
        func point(at ix: Int) -> CGPoint {
            let point = dataPoints[ix]
            let x = rect.width * CGFloat(ix) / CGFloat(dataPoints.count - 1)
            let y = (1 - point) * rect.height
            
            return CGPoint(x: x, y: y)
        }
        
        return Path { p in
            guard dataPoints.count > 1 else { return }
            let start = dataPoints[0]
            p.move(to: CGPoint(x: 0, y: (1 - start) * rect.height))
            
            
            for idx in dataPoints.indices {
                p.addLine(to: point(at: idx))
                
            }
        }
    }
}



struct UniverseGraph: View {
    
    @ObservedObject var viewModel = UniverseViewModel()
    
    
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
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color(.init(displayP3Red: 0.6, green: 0.945, blue: 0.389, alpha: 1)))
                .frame(width: UIScreen.main.bounds.width - 25, height: 400, alignment: .bottom)
                .overlay(LineGraph(dataPoints: priceArray(prices: viewModel.unidata).normalized)
                            .stroke(Color.white, lineWidth: 4)
                            .frame(width: UIScreen.main.bounds.width - 30, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color(.init(displayP3Red: 0.6, green: 0.945, blue: 0.389, alpha: 1)))
                            .overlay(HStack {
                                Text("\(DateFormatter.displayDate.string(from: dateArray(dates: viewModel.unidata)[0]))")
                                        .font(.caption2)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .padding(.top, 370)
                                        .padding(.trailing, 280)
                                
                                })
                            )
            
            
            
            
            
            
            
            VStack{
                HStack{
                    Text("$\(lastPrice(array: priceArray(prices: viewModel.unidata)), specifier: "%.2f")")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
            
                    Spacer()
                }
                HStack{
                    Text("\(percentage(sa: priceArray(prices: viewModel.unidata)), specifier: "%.2f")%")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    Spacer()
                }
                Spacer()
            }
            .onAppear() {
                self.viewModel.fetchData()
            }
            .padding(.top, 30)
            .padding(.leading, 25)
        }
 
    }
}

extension DateFormatter {
    static let displayDate: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "MMMM YYYY"
         return formatter
    }()
}

extension Array where Element == CGFloat {
    
    var normalized : [CGFloat] {
        if let min = self.min(), let max = self.max() {
            return self.map { ($0 - min) / (max - min) }
        }
        return []
    }
}


struct UniverseGraph_Previews: PreviewProvider {
    static var previews: some View {
        UniverseGraph()
    }
}
