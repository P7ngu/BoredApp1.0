//
//  AchievementModel.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import Foundation
import SwiftUI


struct Achievement: Identifiable{
    var id: UUID = UUID()
    var name: String;
    var content: String;
    var color: Color = .blue;
    var completed: Bool = false;
    var completitionStatus: Int = 0; //from 0 to 100
    var imageName: String = "noimage";
    
}

