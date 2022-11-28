//
//  ImageView.swift
//  NasaAPI
//
//  Created by Adriano Rodrigues Vieira on 27/11/22.
//

import SwiftUI

struct ImageView: View {
    private let urlString: String
    private let bounds = UIScreen.main.bounds

    init(urlString: String) {
        self.urlString = urlString
    }

    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: bounds.width - 28, height: bounds.height / 2)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black, lineWidth: 2)
        )
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(urlString: "https://apod.nasa.gov/apod/image/2211/SupernumeraryRainbows_Entwistle_960.jpg")
    }
}
