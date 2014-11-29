//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface CarouselCollectionViewLayout : UICollectionViewLayout

@property(nonatomic) CGSize itemSize;
@property(nonatomic) CGFloat interItemSpace;

@property(nonatomic, readonly) NSIndexPath *indexPathForCenteredItem;

@end
