//
//  ContentView.swift
//  Proclaim Controller
//
//  Created by David on 3/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Proclaim Remote")
                .font(.title)
                .fontWeight(.medium)
            Text("Made by David")
            HStack {
                Button {
                    //apiAuthCall()
                    nextSlide()
                } label: {
                    Text("Next Slide")
                        .font(.title)
                        .fontWeight(.black)
                        .padding(43.0)
                        .background(.black)
                }
                
                Button {
                    prevSlide()
                } label: {
                    Text("Prev Slide")
                        .font(.title)
                        .fontWeight(.black)
                        .padding(43.0)
                        .background {
                            Color(.gray)
                                .opacity(0.2)
                        }
                }
            }
            .padding()
            
            HStack {
                Button {
                    goOnAir()
                } label: {
                    Text("On Air")
                        .font(.title)
                        .fontWeight(.black)
                        .padding(43.0)
                        .background {
                            Color(.gray)
                                .opacity(0.2)
                        }
                }
                
                Button {
                    goOffAir()
                } label: {
                    Text("Off Air")
                        .font(.title)
                        .fontWeight(.black)
                        .padding(43.0)
                        .background(.black)
                }
            }
            .padding()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
