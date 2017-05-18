//
//  CollectionViewCell.m
//  ViewDaGif
//
//  Created by Dan Lindsay on 2017-05-15.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)setUrlString:(NSString *)urlString {
    _urlString = urlString;
    
    [self downloadImageWithURL:urlString];
}

- (void)downloadImageWithURL:(NSString*)urlString {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
        });
        
    }];
    [task resume];
}

@end
