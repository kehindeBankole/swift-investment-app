//
//  CreatePlanView.swift
//  RiseNative
//
//  Created by kehinde on 06/01/2024.
//

import SwiftUI

struct CreatePlanView: View {
    var body: some View {
        VStack{
            HStack(alignment: .center) {
                // Headers/H3 18 Reg
                Text("Create a plan")
                  .font(Font.custom("TomatoGrotesk-Regular", size: 18))
                  .foregroundColor(.black)
              Spacer()
                HStack{
                    Text("View all plans")
                      .font(
                        Font.custom("DMSans-Regular", size: 15)
                          .weight(.bold)
                      )
                      .multilineTextAlignment(.trailing)
                      .foregroundStyle(Color(red: 0.58, green: 0.63, blue: 0.68))
                    
                    Image("arrowLeft").resizable().scaledToFit().frame(width: 4 , height: 9)
                }
            }
            .frame(maxWidth: .infinity)
            
            Text("Start your investment journey by creating a plan\"")
              .font(Font.custom("DMSans-Regular", size: 15))
              .foregroundStyle(Color.riseTextSoft)
              .frame(maxWidth: .infinity, alignment: .topLeading)
              .padding(.vertical , 8)
              
            
            ScrollView(.horizontal, content: {
                ZStack {
                    VStack{
                        Image(systemName: "plus").foregroundColor(Color.riseTeal)
                        .frame(width: 42.63994, height: 42.63994)
                        .background(.white)
                        .cornerRadius(100)
                        
                        Text("Create an investment plan")
                          .font(
                            Font.custom("DMSans-Bold", size: 14)
                            
                          )
                          .multilineTextAlignment(.center).padding(.top , 2)
                       
                    }
                }
                .padding()
                .frame(width: 188, height: 243)
                .background(Color(red: 0.44, green: 0.53, blue: 0.61).opacity(0.1))
                .cornerRadius(12)
            })
            
            
            
        }
    }
}

#Preview {
    CreatePlanView()
}
