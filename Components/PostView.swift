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
        VStack(alignment: .leading, spacing: 30){
            HStack{
                
                Text("\(post.ownerId)")
                    .font(.custom("Roboto-Condensed", size: 30))
                    .foregroundColor(Color.ui.black)
                
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
                .cornerRadius(20.0)
                .padding(.bottom, 20)
            
            Text("(\(post.caption)")
                .multilineTextAlignment(.leading)
                .font(.custom("Montserrat-Medium", size: 15))
                .padding(.bottom, 20)
                .foregroundColor(Color.ui.black)
            
            
            HStack{
               
                
                Image(systemName: "heart.fill")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(Color.ui.orange)
                
                Text("\(post.likeCount)")
                    .padding(.top, 2)
                    .font(.custom("Montserrat-Medium", size: 15))
                    .foregroundColor(Color.ui.black)

                Spacer()
                
                Text("\(NSDate(timeIntervalSince1970: post.date))")
                    .padding(.top, 4)
                    .font(.custom("Montserrat-Thin", size: 15))
                    .foregroundColor(Color.ui.black)
                
                
            }
            
        }
        .padding()
        .background(Color.ui.beige
            .ignoresSafeArea(.all))
    }
}
struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(postId: "1", caption: "Apparently, I’m Reading Too Much", ownerId: "BookLover911", likeCount: 42, date: 0, imageUrl: "https://confessionsofabookgeek.files.wordpress.com/2014/09/so-many-books-gif.gif"))
            .previewLayout(.sizeThatFits)
    }
}
