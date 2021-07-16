//
//  ImageCollectionViewCell.swift
//  client-server-1347
//
//  Created by Марк Киричко on 16.07.2021.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var badgeImageView: UIImageView!
    var representedIdentifier: String = ""
    
    var title: String? {
      didSet {
        titleLabel.text = title
      }
    }
    var image: UIImage? {
      didSet {
        imageView.image = image
      }
    }
    
    var badge: UIImage? {
      didSet {
        badgeImageView.image = badge
      }
    }
  }

