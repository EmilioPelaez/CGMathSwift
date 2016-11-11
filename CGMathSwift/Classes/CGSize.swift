//
//  CGSize.swift
//  Pods
//
//  Created by Emilio Peláez on 11/10/16.
//
//

import Foundation

public func lerp(min: CGSize, max: CGSize, progress: CGFloat) -> CGSize {
	return CGSize(width: lerp(min: min.width, max: max.width, progress: progress),
	              height: lerp(min: min.height, max: max.height, progress: progress))
}

extension CGSize {
	public var aspectRatio: CGFloat {
		return width / height
	}
	
	public init(aspectRatio: CGFloat, thatFitsSize size: CGSize) {
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
