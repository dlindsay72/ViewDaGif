//
//  Giphy.m
//  ViewDaGif
//
//  Created by Dan Lindsay on 2017-05-18.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

#import "Giphy.h"

@implementation Giphy

+ (instancetype) giphyWithDictionary:(NSDictionary *) dictionary {
    Giphy *giphy = [[Giphy alloc] init];
    
    if ( giphy ) {
        giphy.animatedGifURL = [NSURL URLWithString:[dictionary valueForKeyPath:@"images.original.url"]];
        giphy.stillImageURL = [NSURL URLWithString:[dictionary valueForKeyPath:@"images.downsized_still.url"]];
    }
    
    return giphy;
}

@end
