//
//  PureSwiftLib.swift
//  PureSwiftLib
//
//  Created by Rake Yang on 2021/3/17.
//

import Foundation
import PureObjCLib
import YYCategories

public class PureSwiftVersion {
    /// 验证
    public static func verification() -> Bool {
//        DDLogError("verification")
        return NSDate(string: "2021-03-31", format: "yyyy-MM-dd")?.year == 2021 && YHPureObjCVersion.verification()
    }
}
