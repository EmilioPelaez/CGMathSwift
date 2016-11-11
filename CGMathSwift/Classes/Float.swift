//
//  Float.swift
//  Pods
//
//  Created by Emilio Peláez on 11/10/16.
//
//

import Foundation

public func lerp(min: Float, max: Float, progress: Float) -> Float {
	return (1 - progress) * min + progress * max
}

public func inverseLerp(min: Float, max: Float, value: Float) -> Float {
	return (value - min) / (max - min)
}

extension Float {
	public func clamp(min: Float = 0, max: Float = 1) -> Float {
		return CGMathSwift.clamp(value: self, min: min, max: max)
	}
	
	public func remap(fromRange from: (start: Float, end: Float), toRange to: (start: Float, end: Float)) -> Float {
		let t = inverseLerp(min: from.start, max: from.end, value: self)
		return lerp(min: to.start, max: to.end, progress: t)
	}
}
