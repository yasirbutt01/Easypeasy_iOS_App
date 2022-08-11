//
//  AVPlayer+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 12/10/2020.
//

import Foundation
import AVKit

extension AVPlayer {
    var isPlaying: Bool {
        return rate != 0 && error == nil
    }
}
