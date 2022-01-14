//
//  Extensions.swift
//  Stonks
//
//  Created by Андрей Воробьев on 29.12.2021.
//

import Foundation
import UIKit


// MARK: - Framing

extension UIView {
    /// Width of view
    var width: CGFloat{
        frame.size.width
    }
    /// Height of view
    var height: CGFloat{
        frame.size.height
    }
    /// Left edge of view
    var left: CGFloat{
        frame.origin.x
    }
    /// Right edge of view
    var right: CGFloat{
        left + width
    }
    /// Top edge of view
    var top: CGFloat{
        frame.origin.y
    }
    /// Bottom edge of view
    var bottom: CGFloat{
        top + height
    }
}

// MARK: - Add subViews

extension UIView {
    /// Adds multiple subviews
    /// - Parameter views: Collection of subviews
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }        
    }
}


// MARK: - DateFormatter

extension DateFormatter {
    static let newsDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter
    }()
    static let prettyDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
}

// MARK: - String

extension String {
    /// Create a string form time innterval
    /// - Parameter timeInterval: Timeinterval since 1970
    /// - Returns: Formatted string
    static func string(from timeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        return DateFormatter.prettyDateFormatter.string(from: date)
    }
    /// Percentage formatted string
    /// - Parameter double: Double to format
    /// - Returns: String in percent format
    static func percentage(from double: Double) -> String {
        let formatter = NumberFormatter.percentFormatter
        return formatter.string(from: NSNumber(value: double)) ?? "\(double)"
    }
    /// Format number to string
    /// - Parameter number: Number to format
    /// - Returns: Formatted string
    static func formatted(number: Double) -> String {
        let formatter = NumberFormatter.numberFormatter
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
}

// MARK: - ImageView

extension UIImageView {
    /// Sets image from remote url
    /// - Parameter url: URL to fetch from
    func setImage(with url: URL?) {
        guard let url = url else {
            return
        }
        DispatchQueue.global(qos: .userInteractive).async {            
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
}

// MARK: - NumberFormatter

extension NumberFormatter {
    /// Formatter for percent syle
    static let percentFormatter: NumberFormatter = {
       let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    /// Formatter for decimal style
    static let numberFormatter: NumberFormatter = {
       let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}

// MARK: - Notification

extension Notification.Name {
    /// Notification for when symbol gets addedd to watchlist
    static let didAddToWatchList = Notification.Name("didAddToWatchList")
}
