//
//  ExtractTextFromPDFApp.swift
//  ExtractTextFromPDF
//
//  Created by Angelos Staboulis on 25/12/23.
//

import SwiftUI

@main
struct ExtractTextFromPDFApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(pdfURL: "", textURL: "", presented: false).frame(width:400,height:400)
        }.windowResizability(.contentSize)
    }
}
