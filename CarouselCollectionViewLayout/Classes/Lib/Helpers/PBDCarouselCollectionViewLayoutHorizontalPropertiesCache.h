/*
* Copyright (c) 2016 Pawel Dudek. All rights reserved.
*/
#import <Foundation/Foundation.h>
#import "PBDCarouselCollectionViewLayout.h"

@interface PBDCarouselCollectionViewLayoutHorizontalPropertiesCache : NSObject <PBDCarouselCollectionViewLayoutPropertiesCache>

@property(nonatomic, weak, readonly) PBDCarouselCollectionViewLayout *layout;

- (instancetype)initWithLayout:(PBDCarouselCollectionViewLayout *)layout;

@end
