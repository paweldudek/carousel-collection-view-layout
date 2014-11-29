//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//


#import "CarouselCollectionViewController.h"
#import "PBDCarouselCollectionViewLayout.h"

@implementation CarouselCollectionViewController

- (id)init {
    PBDCarouselCollectionViewLayout *layout = [[PBDCarouselCollectionViewLayout alloc] init];
    layout.itemSize = CGSizeMake(280, 240);
    layout.interItemSpace = 20;
    self = [super initWithCollectionViewLayout:layout];
    if (self) {

    }

    return self;
}

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];

    self.collectionView.backgroundColor = [UIColor greenColor];
}

#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.9f green:0.2f blue:0.2f alpha:1.0f];
    return cell;
}

@end
