//
//  ContentView.swift
//  BarAnimation
//
//  Created by stephan rollins on 4/3/20.
//  Copyright © 2020 OmniStack. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedItem = 0
    
    @State var chartData: [[CGFloat]] = [
        [175, 63, 89],
        [15, 200, 7],
        [138, 111, 34]
    ]
    
    var body: some View {
        ZStack{
            
            Color("background").edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Steps").font(.system(size: 34)).fontWeight(.heavy)
                
                Picker(selection: $selectedItem, label: Text("")){
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                HStack(spacing: 30){
                    BarView(value: chartData[selectedItem][0])
                    BarView(value: chartData[selectedItem][1])
                    BarView(value: chartData[selectedItem][2])
                }.padding(.top, 24)
                    .animation(.default)
            }
            

        }
        
    }
}

struct BarView: View {
    
    var value: CGFloat
    
    
    var body: some View{
        VStack{
            ZStack(alignment: .bottom){
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.3874704838, green: 0.8940522075, blue: 0.7536783814, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            Text("\(Int((value / 200) * 100))%").padding(.top, 8)
        }

    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

































