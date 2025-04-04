//
//  CounterView.swift
//  wizDemo2
//
//  Created by Nitin on 04/04/25.
//

import SwiftUI

struct CounterView: View {
    @StateObject var viewModel = CounterViewModel()
    
    var body: some View {
        VStack{
            Spacer()
            
            Text("Current Count : \($viewModel.streakCount.wrappedValue)")
                .font(.title)
                .bold()
               
            Spacer()
            
            VStack{
                Text("Change Streak Count")
                    .foregroundStyle(.gray)
                
                HStack{
                    
                    Spacer()
                    
                    Button{
                        viewModel.decrement()
                    }label:{
                        Image(systemName: "minus.circle.fill")
                            .tint(Color.black)
                    }
                    Spacer()
                    
                    Text("Streak")
                        
                    
                    Spacer()
                    Button{
                        viewModel.increment()
                    }label:{
                        Image(systemName: "plus.circle.fill")
                            .tint(Color.black)
                    }
                    Spacer()
                    
                }
                .frame(width: 190,height: 50)
                .background(Color.gray.opacity(0.7))
                .cornerRadius(10)
                
               
            }
            .frame(width: 200, height: 70)
            .padding(.bottom,350)
            
          
        }
    }
}

#Preview {
    CounterView()
}
