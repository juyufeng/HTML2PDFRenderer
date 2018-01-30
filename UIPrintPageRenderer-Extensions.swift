//
//  UIPrintPageRenderer-Extensions.swift
//  HTMLPDFRenderer
//
//  Copyright © 2015 Aleksandar Vacić, Radiant Tap
//  MIT License · http://choosealicense.com/licenses/mit/
//

import UIKit

extension UIPrintPageRenderer {
	func makePDF() -> Data {
		let data = NSMutableData()

		UIGraphicsBeginPDFContextToData(data, paperRect, nil)
		prepare(forDrawingPages: NSMakeRange(0, numberOfPages))
		let bounds = UIGraphicsGetPDFContextBounds()

		for i in 0 ..< numberOfPages {
			UIGraphicsBeginPDFPage()
			drawPage(at: i, in: bounds)
		}
		UIGraphicsEndPDFContext()

		return data as Data
	}
}
