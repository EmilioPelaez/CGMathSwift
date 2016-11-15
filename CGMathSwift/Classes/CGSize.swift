//
//  CGSize.swift
//  Pods
//
//  Created by Emilio Peláez on 11/10/16.
//
//

import Foundation

public func lerp(start: CGSize, end: CGSize, progress: CGFloat) -> CGSize {
	return CGSize(width: lerp(start: start.width, end: end.width, progress: progress),
	              height: lerp(start: start.height, end: end.height, progress: progress))
}

public extension CGSize {
	public var aspectRatio: CGFloat {
		return width / height
	}
	
	public init(aspectRatio: CGFloat, maxSize size: CGSize) {
		let sizeRatio = size.aspectRatio
		if aspectRatio > sizeRatio {
			width = size.width
			height = size.width / aspectRatio
		} else {
			width = size.height * aspectRatio
			height = size.height
		}
	}
	
	public init(side: CGFloat) {
		self.init(width: side, height: side)
	}
}
