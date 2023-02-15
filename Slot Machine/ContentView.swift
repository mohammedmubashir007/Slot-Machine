//
//  ContentView.swift
//  Slot Machine
//
//  Created by Mohammed Mubashir on 12/02/23.
//

import SwiftUI

struct Hexagona: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let point1 = CGPoint(x: 0, y: 20)
            let point2 = CGPoint(x: 0, y: rect.height-20)
            let point3 = CGPoint(x: rect.width/2, y: rect.height)
            let point4 = CGPoint(x: rect.width, y: rect.height-20)
            let point5 = CGPoint(x: rect.width, y: 20)
            let point6 = CGPoint(x: rect.width/2, y: 0)
            
            
            path .move(to: point6)
            
            path.addArc(tangent1End: point1, tangent2End: point2, radius: 15)
            path.addArc(tangent1End: point2, tangent2End: point3, radius: 15)
            path.addArc(tangent1End: point3, tangent2End: point4, radius: 15)
            path.addArc(tangent1End: point4, tangent2End: point5, radius: 15)
            path.addArc(tangent1End: point5, tangent2End: point6, radius: 15)
            
            
        }
    }
    
    
}

enum Choice : Int, Identifiable {
    
    var id:Int {
        rawValue
    }
    
    case success, failure
    
}

struct ContentView: View {
    
    @State public var symbols = ["eating","happy","love","scary","sleeping"]
    @State public var numbers = [0,1,2,3,4]
    @State public var attempts = 8
    @State public var counter = 0
    @State public var wins = 0
    @State private var showingAlert:Choice?
    
    
    
    var body: some View {
        ZStack {
            Image("sunshine").resizable().ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 50) {
                HStack {
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .orange, radius: 1,y: 3)
                    
                    Text("Slot Machine")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .shadow(color: .orange, radius: 1,y: 3)
                    
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .orange, radius: 1,y: 3)
                }
                .frame(width: .infinity,height: 50,alignment: .center)
   
                Text("\(attempts) out of 8 attempts left...").font(.system(size: 20)).shadow(color: .orange, radius: 1,y: 3)
                
                VStack(spacing: 15) {
                    HStack(spacing: 35) {
                        
                        Hexagona().fill(Color.white.opacity(0.8)).frame(width: 100,height: 120,alignment: .center)
                            .overlay(
                                Image(symbols[numbers[0]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 70,alignment: .center)
                                    .shadow(color: .gray,radius: 4,x: 4,y: 5)
                            )
                        
                        
                        Hexagona().fill(Color.white.opacity(0.8)).frame(width: 100,height: 120,alignment: .center)
                            .overlay(
                                Image(symbols[numbers[1]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 70,alignment: .center)
                                    .shadow(color: .gray,radius: 4,x: 4,y: 5)
                            )
                    }
                    Hexagona().fill(Color.white.opacity(0.8)).frame(width: 100,height: 120,alignment: .center)
                        .overlay(
                            Image(symbols[numbers[2]])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80,height: 70,alignment: .center)
                                .shadow(color: .gray,radius: 4,x: 4,y: 5))
                    HStack(spacing: 35) {
                        
                        Hexagona().fill(Color.white.opacity(0.8)).frame(width: 100,height: 120,alignment: .center)
                            .overlay(
                                Image(symbols[numbers[3]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 70,alignment: .center)
                                    .shadow(color: .gray,radius: 4,x: 4,y: 5)
                            )
                        
                        
                        Hexagona().fill(Color.white.opacity(0.8)).frame(width: 100,height: 120,alignment: .center)
                            .overlay(
                                Image(symbols[numbers[4]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 70,alignment: .center)
                                    .shadow(color: .gray,radius: 4,x: 4,y: 5)
                            )
                    }
                    
                    Text("\(wins) wins").font(.system(size: 20)).shadow(color: .orange, radius: 1,y: 3)
                }
                
                Button {

                    numbers[0] = Int.random(in: 0...numbers.count-1)
                    numbers[1] = Int.random(in: 0...numbers.count-1)
                    numbers[2] = Int.random(in: 0...numbers.count-1)
                    numbers[3] = Int.random(in: 0...numbers.count-1)
                    numbers[4] = Int.random(in: 0...numbers.count-1)
                    
                    counter += 1
                    attempts -= 1
                    
                    
                    if numbers[0] == numbers[1] && numbers[1] == numbers[2] && numbers[2] == numbers[3] && numbers[3] == numbers[4]
                    {
                        self.showingAlert = .success
                        counter = 0
                        attempts = 8
                        wins += 1
                    }
                    
                    
                    if counter > 7 {
                        self.showingAlert = .failure
                        counter = 0
                        attempts = 8
                        
                    }
       
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("color"))
                        .overlay(
                            Text("Spin")
                                .fontWeight(.bold)
                                .font(.title3)
                            
                        )
            
                        .foregroundColor(.black)
                        .frame(width: 200,height: 40,alignment: .center)
                        .shadow(color: .gray, radius: 1,y: 4)
                }

            }
            .alert(item: $showingAlert) { alert -> Alert in
                
                switch alert {
                case .success:
                    return Alert(title: Text("Yahhh! You won"),message: Text("Born with the charm"),dismissButton: .cancel())
                    
                case .failure:
                    return Alert(title: Text("Oooooops"),message: Text("No worries, You can always try again"),dismissButton: .cancel())
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
