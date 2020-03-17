//
//  PhotoCollectionViewDataSource.swift
//  PhotosApp
//
//  Created by Keunna Lee on 2020/03/16.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit
import Photos

class PhotoCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var fetchResult: PHFetchResult<PHAsset> = PHAsset.fetchAssets(with: nil)
    let imageManager = PHCachingImageManager()
    let targetSize: CGSize = CGSize(width: 100, height: 100)
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.CELL_IDENTIFIER, for: indexPath)
        let object = fetchResult.object(at: indexPath.item)
        imageManager.requestImage(for: object, targetSize: targetSize, contentMode: .aspectFill, options: nil) { (image, _) in
            let imageView = UIImageView(image: image)
            cell.addSubview(imageView)
        }
        return cell
    }
}
