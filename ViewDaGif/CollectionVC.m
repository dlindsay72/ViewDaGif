//
//  CollectionVC.m
//  ViewDaGif
//
//  Created by Dan Lindsay on 2017-05-15.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

#import "CollectionVC.h"
#import "CollectionViewCell.h"

@interface CollectionVC ()
@property (nonatomic, strong) NSArray *imageURLs;

@end

@implementation CollectionVC

static NSString * const reuseIdentifier = @"GifViewerCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self refreshImages];
    
}

- (void) refreshImages {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"https://api.giphy.com/v1/gifs/trending?api_key=dc6zaTOxFJmzC&rating=r"];
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      //  NSString *responseText = [[NSString alloc] initWithContentsOfURL:location encoding:NSUTF8StringEncoding error:nil];
        
        NSData *data = [[NSData alloc] initWithContentsOfURL:location];
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        
        
        // data array > images > downsized_still > url
        
        self.imageURLs = [dictionary valueForKeyPath:@"data.images.downsized_still.url"];
        
        NSLog(@"%@", self.imageURLs);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
        
        
    }];
    [task resume];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.imageURLs count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    NSString *urlString = [self.imageURLs objectAtIndex:indexPath.row];  // or self.imageURLs[indexPath.row]
    
    cell.urlString = urlString;
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
//    cell.imageView.image = [UIImage imageWithData:imageData];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
