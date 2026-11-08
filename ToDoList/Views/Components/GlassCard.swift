//
//  GlassCard.swift
//  ToDoList
//
//  Created by Almeida, Renato Pereira de on 08/11/26.
//


import SwiftUI

struct GlassCard<Content: View>: View {

    let content: Content

    init(
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
    }

    var body: some View {

        content
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 24
                )
            )
            .overlay {

                RoundedRectangle(
                    cornerRadius: 24
                )
                .stroke(
                    Color.white.opacity(0.15),
                    lineWidth: 1
                )
            }
    }
}