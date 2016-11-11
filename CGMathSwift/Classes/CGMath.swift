//
//  CGMath.swift
//  CGMathSwift
//
//  Created by Emilio Peláez on 6/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

public func clamp<T: Comparable>(value: T, min: T, max: T) -> T {
	return Swift.max(min, Swift.min(max, value))
}
