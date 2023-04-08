//
//  ContentView.swift
//  SegmentControlSwiftUI
//
//  Created by sss on 08.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var segmentIndex = 0
    @State var offsetX = 0
    
    var company = ["Nike", "Puma", "Adidas"]
    var imageName = ["image1", "image2", "image3"]
    
    var body: some View {
        VStack {
            
            Text("Кроссовки \(company[segmentIndex])").font(Font.system(.title))
            
            Spacer()
            
            ZStack {
                //RoundedRectangle(cornerRadius: 10)
                   // .fill(.secondary)
                   // .offset(x: CGFloat(offsetX))
                    
                Image(imageName[segmentIndex])
                    .resizable()
                    .frame(width: 400, height: 400)
                    .offset(x: CGFloat(offsetX))
            }.padding().animation(.spring(response: 0.3, blendDuration: 0.3))
            

            
            Picker(selection: Binding(get: {
                segmentIndex
            }, set: { newValue in
                segmentIndex = newValue
                offsetX = -500
                moveBack()
            })) {
                
                ForEach(0 ..< company.count, id: \.self) {
                    Text(company[$0]).tag($0)
                }
            } label: {
                Text("")
            }.pickerStyle(.segmented)

            Spacer().frame(height: 140)
        }
        .padding()
    }
    
    private func moveBack() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            offsetX = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
