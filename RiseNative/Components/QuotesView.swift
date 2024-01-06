//
//  QuotesView.swift
//  RiseNative
//
//  Created by kehinde on 06/01/2024.
//

import SwiftUI

struct QuotesView: View {
    @State private var quotes : QuotesModel? = nil
    let sharedText = "Hello, check out this amazing app!"
    
    let example = Image("rise")
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing:14){
                Text("TODAY’S QUOTE")
                    .font(
                        .custom("DMSans-Bold", size: 14)
                    )
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                
                
                if(quotes != nil){
                    Text(quotes!.quote)
                        .font(.custom("DMSans-Regular", size: 15))
                    
                    
                    HStack(alignment: .center) {
                        Text(quotes!.author)
                            .font(
                                .custom("DMSans-Bold", size: 15)
                            )
                            .foregroundColor(Color(red: 0.58, green: 0.63, blue: 0.68))
                        Spacer()
                        
                        HStack(alignment: .center, spacing: 10) {
                            ShareLink(item: """
                        Today's Quote: " \(quotes!.quote)" - \(quotes!.author) https://risevest.com
                        """  , label: {
                                Image("share").renderingMode(.template).resizable().scaledToFit().frame(width: 18, height: 18).foregroundStyle(.black)
                            })
                            
                        }
                        .padding(12)
                        .background(.white)
                        .cornerRadius(25)
                        
                    }
                    .padding(.top , 10)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                }
  
                
            }
        }
        .padding(20)
        .background(.white.opacity(0.6))
        .background(
            Image("quotes")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 237)
                .clipped()
        )
        .cornerRadius(15).task {
            do{
                let data : QuotesModel? = try await makeApiCall(endpoint: baseUrl + "/quotes", method: .get)
                
                if let quotesData = data {
                    quotes = quotesData
                }
            }catch{
                
            }
        }
    }
}

#Preview {
    QuotesView()
}
