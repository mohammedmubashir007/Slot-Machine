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
    
    case Success, failure
    
}

struct ContentView: View {
    
    @State public var symbols = ["eating","happy","love"]
    @State public var numbers = [0,1,2]
    @State public var counter = 0
    @State private var showingAlert:Choice?
    
    
    
    var body: some View {
        ZStack {
            Image("sunshine").resizable().ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 80) {
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
                
                
                VStack(spacing: 15) {
                    HStack(spacing: 35) {
                        
                        Hexagona().fill(Color.white.opacity(0.8)).frame(width: 100,height: 120,alignment: .center)
                            .overlay(
                                Image(symbols[0])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 70,alignment: .center)
                                    .shadow(color: .gray,radius: 4,x: 4,y: 5)
                            )
                        
                        
                        Hexagona().fill(Color.white.opacity(0.8)).frame(width: 100,height: 120,alignment: .center)
                            .overlay(
                                Image(symbols[0])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 70,alignment: .center)
                                    .shadow(color: .gray,radius: 4,x: 4,y: 5)
                            )
                    }
                    
                    
                    Hexagona().fill(Color.white.opacity(0.8)).frame(width: 100,height: 120,alignment: .center)
                        .overlay(
                            Image(symbols[0])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80,height: 70,alignment: .center)
                                .shadow(color: .gray,radius: 4,x: 4,y: 5)
                        )
                    
                    
                    
                    
                    HStack(spacing: 35) {
                        
                        Hexagona().fill(Color.white.opacity(0.8)).frame(width: 100,height: 120,alignment: .center)
                            .overlay(
                                Image(symbols[0])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 70,alignment: .center)
                                    .shadow(color: .gray,radius: 4,x: 4,y: 5)
                            )
                        
                        
                        Hexagona().fill(Color.white.opacity(0.8)).frame(width: 100,height: 120,alignment: .center)
                            .overlay(
                                Image(symbols[0])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 70,alignment: .center)
                                    .shadow(color: .gray,radius: 4,x: 4,y: 5)
                            )
                    }
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
