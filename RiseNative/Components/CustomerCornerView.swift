//
//  CustomerCornerView.swift
//  RiseNative
//
//  Created by kehinde on 06/01/2024.
//

import SwiftUI

struct CustomerCornerView: View {
    var body: some View {
        VStack{
   
            Text("Customer Corner")
              .font(Font.custom("TomatoGrotesk-Regular", size: 18))
              .foregroundColor(.black)
              .frame(maxWidth: .infinity, alignment: .topLeading)
            
            Divider()
            HStack(alignment: .center, spacing: 20) {
                HStack(spacing:15){
                    Image(systemName: "message.fill").foregroundStyle(.white)
                    .frame(width: 40, height: 40)
                    .background(Color.riseTeal)
                    .cornerRadius(100)
                    VStack{
                
                        Text("Need help?")
                          .font(Font.custom("DMSans-Regular", size: 17))
                          .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                          .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                     
                        Text("Tap to send us an email")
                          .font(Font.custom("DMSans-Regular", size: 15))
                          .foregroundColor(Color.riseTextSoft)
                          .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                    }
                }
                Spacer()
                
                Image("arrowLeft").resizable().scaledToFit().frame(width: 8 , height: 14)
            }
            .padding(.vertical , 15)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            HStack(alignment: .center, spacing: 20) {
                HStack(spacing:15){
                    Image(systemName: "play.fill").foregroundStyle(.white)
                    .frame(width: 40, height: 40)
                    .background(Color.riseTeal)
                    .cornerRadius(100)
                    VStack{
                
                        Text("Rise Onboarding Series")
                          .font(Font.custom("DMSans-Regular", size: 17))
                          .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                          .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                     
                        Text("Watch our onboarding videos to get started")
                          .font(Font.custom("DMSans-Regular", size: 15))
                          .foregroundColor(Color.riseTextSoft)
                          .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                    }
                }
                Spacer()
                
                Image("arrowLeft").resizable().scaledToFit().frame(width: 8 , height: 14)
            }
            .padding(.vertical , 15)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
        }
    }
}

#Preview {
    CustomerCornerView()
}
