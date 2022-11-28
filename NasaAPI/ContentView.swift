//
//  ContentView.swift
//  NasaAPI
//
//  Created by Adriano Rodrigues Vieira on 24/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var data: PictureOfDayDataModel? = nil

    var body: some View {
        ScrollView {
            VStack {
                Text(data?.title ?? "")
                    .font(.title)
                    .bold()
                    .padding(.vertical)
                ImageView(urlString: data?.url ?? "")
                    .padding(.all)
                Text(data?.explanation ?? "")
                    .padding(.horizontal)
            }
            .padding(.all)
            .onAppear {
                NetworkManager().getData { result in
                    switch result {
                    case .success(let data):
                        self.data = data
                        print(data)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
