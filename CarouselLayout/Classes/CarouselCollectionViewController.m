//
//  Copyright (c) 2014 dudek. All rights reserved.
//


#import "CarouselCollectionViewController.h"
#import "CarouselCollectionViewLayout.h"

@implementation CarouselCollectionViewController

- (id)init {
    CarouselCollectionViewLayout *layout = [[CarouselCollectionViewLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    if (self) {

    }

    return self;
}

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
}

@end
