//
//  Giphy.h
//  ViewDaGif
//
//  Created by Dan Lindsay on 2017-05-18.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Giphy : NSObject

@property (nonatomic, strong) NSURL *stillImageURL;
@property (nonatomic, strong) NSURL *animatedGifURL;

+ (instancetype) giphyWithDictionary:(NSDictionary *) dictionary;

@end
