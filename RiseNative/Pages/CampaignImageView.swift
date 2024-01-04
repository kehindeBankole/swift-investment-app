//
//  CampaignImageView.swift
//  RiseNative
//
//  Created by kehinde on 31/12/2023.
//

import SwiftUI

struct CampaignImageView: View {
    @State var campaign : CampaignModel
    @Environment(AppData.self) private var appData
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: campaign.thumbnail_url!), content: { image in
                image.ImageModifier()
            }, placeholder: {
                Image(systemName: "person.circle").ImageModifier().foregroundStyle(Color.riseIconColor)
            })
        } .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.riseCampaignImageColor).toolbar{
                ToolbarItem(placement: .topBarLeading){
                 
                   
                            HStack{
                                Button(action: {
                                    appData.path.removeLast()
                                }, label: {
                                    Image(systemName: "xmark")
                                                   .foregroundColor(.white)
                                                   .padding(10)
                                                   .background(Color.riseTextNeutral)
                                                   .cornerRadius(100)
//                                    Image(systemName: "xmark").foregroundColor(.white)
                                })
                                Spacer()
             
                    }
                }
            }.navigationBarBackButtonHidden(true)
    }
}



