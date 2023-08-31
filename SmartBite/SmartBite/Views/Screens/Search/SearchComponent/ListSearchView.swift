//
//  ListSearchView.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/07/09.
//

import SwiftUI

struct ListSearchView: View {
    var hint: Hint?

    init(hint: Hint?) {
        if let safeHint = hint {
            self.hint = safeHint
        }
    }
    var body: some View {
        HStack (spacing: 10) {
           
            AsyncImage(url: URL(string: hint?.food?.image ?? "No Image")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(10)
                            
                    } placeholder: {
                        Image("no food image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    }
                    .frame(width: 65, height: 65)
           
            VStack (alignment: .leading){
                Text(hint?.food?.label ?? "")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
            }
            Spacer()
            VStack (alignment: .leading) {
                Text("Calories")
                    .foregroundColor(Color.gray)
                    .font(.headline)
                Text(String(format: "%.f", hint?.food?.nutrients?.enercKcal ?? 0))
                    .foregroundColor(Color.black)
                

            }
            Image(systemName: "chevron.forward")
                .foregroundColor(Color.black)
            
        }
        .padding(.horizontal)
            .frame(height: 110)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(20)
            
    }
}

//struct ListSearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListSearchView(hint: H)
//    }
//}
