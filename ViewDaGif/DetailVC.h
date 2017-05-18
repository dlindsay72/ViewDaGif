//
//  DetailVC.h
//  ViewDaGif
//
//  Created by Dan Lindsay on 2017-05-18.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Giphy;

@interface DetailVC : UIViewController

@property (strong, nonatomic) Giphy *giphy;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
