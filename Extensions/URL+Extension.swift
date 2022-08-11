//
//  URL+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 25/11/2020.
//

import Foundation
import AVFoundation
import UIKit

extension URL {
    func movToMp4( completion: @escaping (Bool, String) -> ()) {
        let asset = AVAsset(url: self)
        let fileMgr = FileManager.default
        let dirPaths = fileMgr.urls(for: .documentDirectory, in: .userDomainMask)
        let filePath = dirPaths[0].appendingPathComponent("output.mp4")
        let exportSession = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetMediumQuality)
        
        // remove file if already exits
        let fileManager = FileManager.default
        do {
            try fileManager.removeItem(at: filePath)
        } catch {
            print("can't")
        }
        
        exportSession?.outputFileType = AVFileType.mp4
        exportSession?.metadata = asset.metadata
        exportSession?.outputURL = filePath
        
        exportSession?.exportAsynchronously {
            if exportSession?.status == .completed {
                completion(true, filePath.absoluteString)
            } else if exportSession?.status == .cancelled {
                completion(false, "canceled")
            } else {
                completion(false, (exportSession?.error?.localizedDescription)!)
            }
        }
    }
}
