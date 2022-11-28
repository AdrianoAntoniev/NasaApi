//
//  PictureOfDayDataModel.swift
//  NasaAPI
//
//  Created by Adriano Rodrigues Vieira on 24/11/22.
//

import Foundation

struct PictureOfDayDataModel: Decodable {
    let date: String?
    let explanation: String?
    let hdurl: String?
    let mediaType: String?
    let serviceVersion: String?
    let title: String?
    let url: String?
}
