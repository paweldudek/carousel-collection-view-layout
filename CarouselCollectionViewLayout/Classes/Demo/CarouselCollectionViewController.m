//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//


#import "CarouselCollectionViewController.h"
#import "PBDCarouselCollectionViewLayout.h"

@implementation CarouselCollectionViewController

- (id)init {
    PBDCarouselCollectionViewLayout *layout = [[PBDCarouselCollectionViewLayout alloc] init];
    layout.itemSize = CGSizeMake(540, 300);
    layout.interItemSpace = 40;
    layout.headerSize = CGSizeMake(100, 490);
    layout.footerSize = CGSizeMake(100, 490);
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
    [self.collectionView registerClass:[UICollectionReusableView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"Header"];

    [self.collectionView registerClass:[UICollectionReusableView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                   withReuseIdentifier:@"Footer"];

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

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    UICollectionReusableView *view;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                  withReuseIdentifier:@"Header"
                                                         forIndexPath:indexPath];
        view.backgroundColor = [UIColor yellowColor];
    }
    else {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                  withReuseIdentifier:@"Footer"
                                                         forIndexPath:indexPath];
        view.backgroundColor = [UIColor purpleColor];
    }

    return view;
}

@end
