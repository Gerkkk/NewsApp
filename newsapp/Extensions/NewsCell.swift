//
//  NewsCell.swift
//  newsapp
//
//  Created by Danya Polyakov on 24.12.2024.
//

import Foundation
import UIKit


final class NewsCell: UITableViewCell {
    static let reuseId: String = "NewsCell"
    
    private enum Constants {
        static let titleFont: UIFont = UIFont.italicSystemFont(ofSize: 15)
        static let briefFont: UIFont = UIFont.italicSystemFont(ofSize: 10)
        static let statusText = "Hot news"
        static let wrapColor: UIColor = UIColor(red: 40/255, green: 67/255, blue: 103/255, alpha: 1.0)
        static let briefColor: UIColor = UIColor(red: 199/255, green: 208/255, blue: 204/255, alpha: 1.0)
        static let wrapRadius: CGFloat = 16
        static let wrapOffsetV: CGFloat = 5
        static let wrapOffsetH: CGFloat = 10
        static let wishLabelOffset: CGFloat = 15
        static let textFieldWidth = CGFloat(250)
        static let smallButtonWidth = CGFloat(100)
    }
    
    private let Title: UILabel = UILabel()
    private let Brief: UILabel = UILabel()
    private let Time: UILabel = UILabel()
    private let Source: UILabel = UILabel()
    private let Status: UILabel = UILabel()
    private let shimmer: ShimmerView = ShimmerView()
    let ImageWrap: UIImageView = UIImageView()
    var Image: UIImage = UIImage()
    
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with news: ArticleModel) {
        Title.text = news.title
        Title.textColor = .white
        Title.font = Constants.titleFont
        Brief.text = news.announce
        Brief.textColor = Constants.briefColor
        Brief.font = Constants.briefFont
        Time.text = news.timeOfReading
        Time.textColor = .white
        Time.font = Constants.briefFont
        Source.text = news.sourceName
        Source.textColor = .white
        Source.font = Constants.briefFont
        ImageWrap.image = Image
        ImageWrap.clipsToBounds = true
        
        if news.isHotNews ?? false {
            Status.text = Constants.statusText
        }
        
        DispatchQueue.global().async { [self] in
            if news.img != nil && news.img!.url != nil {
                self.Image = loadImage(url: news.img!.url!)!
            }
        }
    }
    
    private func loadImage(url: URL) -> UIImage? {
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        return UIImage(data: data)
    }
    
    private func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
        self.contentView.addSubview(ImageWrap)
        ImageWrap.backgroundColor = Constants.wrapColor
        ImageWrap.layer.cornerRadius = Constants.wrapRadius
        ImageWrap.pinVertical(to: self, Constants.wrapOffsetV)
        ImageWrap.pinHorizontal(to: self, Constants.wrapOffsetH)
        ImageWrap.addSubview(Title)
        ImageWrap.addSubview(Brief)
        ImageWrap.addSubview(Time)
        ImageWrap.addSubview(Source)
        ImageWrap.addSubview(Status)
        ImageWrap.addSubview(shimmer)
        ImageWrap.tintColor = .black
        
//        self.contentView.addSubview(shimmer)
//        shimmer.setHeight(300)
//        shimmer.setWidth(300)
//        shimmer.pinTop(to: contentView, 10)
//        shimmer.startAnimating()
        
        Brief.numberOfLines = 5
        Brief.setHeight(50)
        Brief.setWidth(300)
        Brief.pinBottom(to: ImageWrap.bottomAnchor)
        Brief.pinLeft(to: ImageWrap.leadingAnchor, Constants.wrapOffsetH)
        
        Title.pinBottom(to: Brief.topAnchor)
        Title.numberOfLines = 2
        Title.setHeight(40)
        Title.setWidth(300)
        Title.pinLeft(to: ImageWrap.leadingAnchor, Constants.wrapOffsetH)
        
        Source.pinTop(to: ImageWrap, Constants.wishLabelOffset)
        Source.pinLeft(to: ImageWrap.leadingAnchor, Constants.wrapOffsetH)
        
        Status.pinTop(to: Source.bottomAnchor, Constants.wishLabelOffset)
        Status.pinLeft(to: ImageWrap.leadingAnchor, Constants.wrapOffsetH)
        
        Time.pinTop(to: ImageWrap, Constants.wishLabelOffset)
        Time.pinRight(to: ImageWrap)
    }
}
