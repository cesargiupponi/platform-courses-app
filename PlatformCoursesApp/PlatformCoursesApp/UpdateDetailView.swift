//
//  UpdateDetailView.swift
//  PlatformCoursesApp
//
//  Created by Cesar Giupponi on 28/05/25.
//

import SwiftUI

struct UpdateDetailView: View {

    var update: Update = updateData[1]

    var body: some View {
        List {
            VStack(spacing: 20) {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle(update.title)
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    UpdateDetailView()
}
