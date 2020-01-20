//
//  PerformanceMeasurement.swift
//  PerformanceTesting
//
//  Created by Peter de Tagyos on 1/18/20.
//  Copyright © 2020 Peter de Tagyos. All rights reserved.
//

import Foundation
import os.log

public class PerformanceTrace {
    let signpost: StaticString
    let name: String
    
    init(signpost: StaticString, name: String) {
        self.signpost = signpost
        self.name = name
    }
}

public class PerformanceMeasurement {    
    public static let signpost1: StaticString = "PerfTrace"
    public static let performanceLog = OSLog(subsystem: "com.ptss.performance", category: "PerformanceMeasurement")
    
    public static func startTrace(with name: String) -> PerformanceTrace {
        let trace = PerformanceTrace(signpost: signpost1, name: name)
        os_signpost(.begin, log: performanceLog, name: signpost1, "%{public}s", name)
        return trace
    }
    
    public static func endTrace(_ trace: PerformanceTrace) {
        os_signpost(.end, log: performanceLog, name: signpost1, "%{public}s", trace.name)
    }
}
