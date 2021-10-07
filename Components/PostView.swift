//
//  PostView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/10/07.
//

import SwiftUI

extension String{

func loadImage() -> UIImage{
    do{
        guard let url = URL(string: self) else {
            return UIImage()
        }

        let data: Data = try Data(contentsOf: url)
        return UIImage(data: data) ?? UIImage()
    } catch{
        return UIImage()
    }

}
}

struct PostView: View {
    
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("\(post.ownerId)")
                    .fontWeight(.bold)
                
                Spacer()
               
                Image(systemName: "highlighter")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
            }
            
            
            Image(uiImage: "\(post.imageUrl)".loadImage())
                .resizable()
                .scaledToFit()
            
            
            Text("My caption will be added here")
                .multilineTextAlignment(.leading)
            
            HStack{
               
                
                Image(systemName: "heart")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(Color.red)
                
                Text("\(post.likeCount)")
                    .padding(.top, 2)
                    .font(.title3)

                Spacer()
                
                Text("\(NSDate(timeIntervalSince1970: post.date))")
                    .padding(.top, 4)
                
                
            }
            
        }.padding()
    }
}
struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(postId: "1", caption: "Caption", ownerId: "Owner", likeCount: 0, date: 0, imageUrl: "https://dogtime.com/assets/uploads/2011/03/puppy-development.jpg"))
            .previewLayout(.sizeThatFits)
    }
}
