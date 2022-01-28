//
//  ContentView.swift
//  ZoomableExample
//
//  Created by jasu on 2022/01/28.
//  Copyright (c) 2022 jasu All rights reserved.
//

import SwiftUI
import Zoomable

struct ContentView: View {
    
    private let url = URL(string: "https://images.unsplash.com/photo-1641130663904-d6cb4772fad5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1432&q=80")!
    
    @State private var selection: Int = 0
    
    private var content: some View {
        GeometryReader { proxy in
            TabView(selection: $selection) {
                ZoomableView(size: CGSize(width: proxy.size.width, height: proxy.size.width * (2/3)), min: 1.0, max: 6.0, showsIndicators: true) {
                    Image("bany")
                        .resizable()
                        .scaledToFit()
                        .background(Color.black)
                        .clipped()
                    
                }
                .frame(width: proxy.size.width, height: proxy.size.width * (2/3))
                .overlay(
                    Rectangle()
                        .fill(Color.clear)
                        .border(.black, width: 1)
                )
                .tabItem {
                    Image(systemName: "0.square.fill")
                    Text("ZoomableView")
                }
                .tag(0)
                
                ZoomableImageView(url: url, min: 1.0, max: 3.0, showsIndicators: true) {
                    Text("ZoomableImageView")
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(8)
                        .foregroundColor(Color.white)
                }
                .overlay(
                    Rectangle()
                        .fill(Color.clear)
                        .border(.black, width: 1)
                )
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("ZoomableImageView")
                }
                .tag(1)
            }
        }
    }
    var body: some View {
#if os(iOS)
        NavigationView {
            content
                .navigationTitle(Text(selection == 0 ? "ZoomableView" : "ZoomableImageView"))
                .navigationBarTitleDisplayMode(.inline)
                .padding()
        }
        .navigationViewStyle(.stack)
#else
        ZStack {
            content
                .padding()
        }
        
#endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

