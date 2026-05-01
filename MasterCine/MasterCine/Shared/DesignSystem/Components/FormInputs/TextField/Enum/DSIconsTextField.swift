//
//  DSIconsTextField.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 01/05/26.
//

enum DSIconsTextField {
    case person
    case envelope
    case lock
    case search
    
    var outlinedIcon: String {
        switch self {
            case .person: "person"
            case .envelope: "envelope"
            case .lock: "lock"
            case .search: "magnifyingglass"
        }
    }
    
    var fillIcon: String {
        switch self {
            case .person: "person.fill"
            case .envelope: "envelope.fill"
            case .lock: "lock.fill"
            case .search: "magnifyingglass"
        }
    }
}
