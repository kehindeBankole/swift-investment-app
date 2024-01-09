//
//  OnboardingVideosView.swift
//  RiseNative
//
//  Created by kehinde on 08/01/2024.
//

import SwiftUI
import AVKit

struct OnboardingVideosView: View {
    @State private var currentVideo = 0
    @State private var videos : [OnboardingVideoModel]? = nil
    @Environment(AppData.self) private var appData
    @State private var isLoading = false
    
    var body: some View {
        VStack {
                  
            ZStack(alignment: .topLeading){
             
                
                if(videos != nil && (videos!.count > 0)){
                    let player = AVPlayer(url: URL(string: videos![currentVideo].url)!)
                    VideoPlayer(player:player).frame(height: 320).onAppear {
                        player.play()
                        player.isMuted = false
                    }.id(currentVideo)
                }else{
                    Rectangle().frame(height: 320)
                }
                Button(action: {
                    appData.path.removeLast()
                }, label: {
                    Circle().fill(.ultraThinMaterial).frame(width: 36).overlay(content: {
                        Image(systemName: "arrow.left").foregroundStyle(.white)
                    })
                        
                }).padding()
            }
             
            VStack{
              
                ScrollView{
                    HStack{
                        VStack(spacing: 4){
                            if(videos != nil){
                                Text("Welcome to Rise • \(currentVideo + 1)/\(videos!.count)")
                                    .font(.custom("DMSans-Regular", size: 17))
                            }else{
                                Text("Welcome to Rise")
                                    .font(.custom("DMSans-Regular", size: 17))
                            }
                            
                            Text("Rise Onboarding Series")
                                .font(Font.custom("DMSans-Regular", size: 15))
                                .foregroundColor(Color.riseTextSoft)
                        }.padding()
                        Spacer()
                    }
                    
                    if(videos == nil){
                        VStack{
                            SkeletonLoaderView().frame(height : 123)
                            SkeletonLoaderView().frame(height : 123)
                        }.padding()
                    }else{
                            ForEach(Array(videos!.enumerated()) , id:\.element.url){index, video in
                                LazyVStack{
                                    Button(action: {
                                        currentVideo = index
                                    }, label: {
                                        HStack{
                                            AsyncImage(url: URL(string: video.thumbnail_url), content: { image in
                                                image.ImageModifier()
                                            }, placeholder: {
                                                Image("rise").ImageModifier().foregroundStyle(Color.riseIconColor).frame(width : 128 , height:96)
                                            })
                                            
                                            VStack(alignment: .leading, spacing: 4) {
                                           
                                                Text(video.title)
                                                  .font(Font.custom("DMSans-Regular", size: 17))
                                                  .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                                                  .frame(maxWidth: .infinity, alignment: .topLeading)
                                                
                                                
                                                if(currentVideo == index){
                                                    Text("Now playing")
                                                      .font(Font.custom("DMSans-Regular", size: 15))
                                                      .foregroundStyle(Color.riseTeal)
                                                }else{
                                                    Text("\(formatTime(timeInterval:video.display_duration))")
                                                      .font(Font.custom("DMSans-Regular", size: 15))
                                                      .foregroundColor(Color(red: 0.44, green: 0.53, blue: 0.61))
                                                }
                                                
                                            }
                                            .padding(0)
                                            .frame(width: 181, alignment: .topLeading)
                                            
                                        }.padding()
                                    })
                                }.background(currentVideo == index ? Color.riseTextSoft.opacity(0.1) : .white)
                            }
                    }
                  
                }
            }
              
                 Spacer()
              }
        .navigationBarBackButtonHidden(true).task {
            do{
                isLoading = true
                let data : [OnboardingVideoModel]? = try await makeApiCall(endpoint: updateBaseUrl + "/config?entity=intro&filter_key=platform&filter_value=mobile", method: .get)
                if let videoData = data{
                    videos = videoData
                }
                isLoading = false
                print(data!)
            }catch{
                isLoading = false
                print(error)
            }
        }
    }
}
