//
//  ClientCellViewModelType.swift
//  MissedCallApp
//
//  Created by Stanislav BEREZIN on 21.03.2021.
//

import Foundation

protocol ClientCellViewModelType: class {
    var clientName: String? { get }
    var clientAddress: String? { get }
    var duration: String? { get }
    var created: String? { get }
}
