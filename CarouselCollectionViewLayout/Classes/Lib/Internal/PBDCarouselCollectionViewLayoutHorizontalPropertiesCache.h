/*
* Copyright (c) 2016 Pawel Dudek. All rights reserved.
*/
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PBDCarouselCollectionViewLayoutPropertiesCache.h"

@class PBDCarouselCollectionViewLayout;

@interface PBDCarouselCollectionViewLayoutHorizontalPropertiesCache : NSObject <PBDCarouselCollectionViewLayoutPropertiesCache>

@property(nonatomic, weak, readonly) PBDCarouselCollectionViewLayout *layout;

- (instancetype)initWithLayout:(PBDCarouselCollectionViewLayout *)layout;

@end
