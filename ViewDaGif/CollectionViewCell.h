//
//  CollectionViewCell.h
//  ViewDaGif
//
//  Created by Dan Lindsay on 2017-05-15.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Giphy;

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) Giphy *giphy;

@end
