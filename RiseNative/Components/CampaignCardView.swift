//
//  CampaignCardView.swift
//  RiseNative
//
//  Created by kehinde on 31/12/2023.
//

import SwiftUI



struct ImageCampaignView : View {
    @State var campaign:CampaignModel
    @Environment(ApiData.self) private var appData
    var body: some View{
     
            HStack{
                    AsyncImage(url: URL(string: campaign.thumbnail_url!), content: { image in
                        image.resizable().scaledToFill()
                    }, placeholder: {
                        Image(systemName: "person.circle").ImageModifier().frame(width: 40 , height:40).foregroundStyle(Color.riseIconColor)
                    })
  
            }.padding(0).onTapGesture {
                appData.path.append(campaign)
            }
 
    }
}

struct ArticleCampaignView : View {
    @State var campaign:CampaignModel
    var body: some View{
 
            VStack{
                GeometryReader{ geo in
                    
                    Link(destination: URL(string: campaign.article_url!)!){
                        VStack{
                            AsyncImage(url: URL(string: campaign.thumbnail_url!), content: { image in
                                image.resizable().scaledToFill().frame(height:geo.size.height / 2.5)
                            }, placeholder: {
                                Image(systemName: "person.circle").ImageModifier().frame(width: 40 , height:geo.size.height / 2.5).foregroundStyle(Color.riseIconColor)
                            }).padding(.bottom , 13)
                            VStack{
                                HStack{
                                    Text(campaign.title).font(.custom("DMSans-Medium", size: 14)).foregroundStyle(Color.riseText600).multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                HStack{
                                    Spacer()
                                    Image("article").renderingMode(.template).resizable().scaledToFit().frame(width: 40 , height: 40).foregroundStyle(Color.riseText300)
                                }
                            }.padding()
                        }
                    }
                   
                }
            }

    }
}


struct CampaignCardView: View {
    
    @State private var campaigns : [CampaignModel] = []
    @State private var onboarding = []
    @State var currentView = 1
    
    var body: some View {
        
            VStack{
                
                TabView(selection: $currentView,
                        content:  {
                    Image("get-started-bg").resizable().scaledToFill().tag(1).frame(width: UIScreen.main.bounds.width)
                    
                    ZStack(alignment: .bottomTrailing){
                        Image("onboarding-bg").resizable().scaledToFill().tag(2)
                        Image(systemName: "play.circle.fill").resizable().frame(width: 50 , height: 50).foregroundStyle(.white).padding().padding()
                    }.tag(2)
                    if(campaigns.count > 0){
                        ForEach(Array(campaigns.enumerated()) , id:\.element.id){index , campaign in
                            switch(campaign.campaign_type){
                            case "image":
                                ImageCampaignView(campaign: campaign).tag(index+3)
                            case "article":
                                ArticleCampaignView(campaign: campaign).tag(index+3)
                            default:
                                Text("link").tag(index+3)
                            }
                        }
                    }
                    
                    
                }).tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)).cornerRadius(20)
                HStack{
                    ForEach( 0 ..< (campaigns.count + 2) , id:\.self){index  in
                        let isActive = index == currentView-1
                        Rectangle().fill(isActive ? Color.riseActiveCard : Color.textSoft).opacity(isActive ? 1 : 0.2).frame(width: index == currentView-1 ? 12 : 5 , height: 5).cornerRadius(20).animation(.default, value: isActive)
                    }
                }
            }.task {
                do{
                    let data : [CampaignModel]? =   try await makeApiCall(endpoint: "\(updateBaseUrl)/campaigns", method: .get)
                    campaigns = data!
                }catch {
                    print(error)
                }
            }
    }
}

#Preview {
    CampaignCardView()
}
