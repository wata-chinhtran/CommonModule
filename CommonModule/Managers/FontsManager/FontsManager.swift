//
//  FontsManager.swift
//  CommonModule

import UIKit
import Foundation

final class FontsManager {
    private init() {}
    static var shared = FontsManager()
    var main: CiaoFont = BarlowFont()
    var interFont: InterfFont = InterfFont()
    var table = ArialFont()
    var titleHeading: IBMPlexSerifFont = IBMPlexSerifFont()
    var subtitle: SFCompactFont = SFCompactFont()
    var sourceSansPro: SourceSansPro = SourceSansPro()
}
