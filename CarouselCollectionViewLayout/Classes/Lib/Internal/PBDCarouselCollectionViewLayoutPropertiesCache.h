/*
* Copyright (c) 2016 dudek. All rights reserved.
*/
#import <Foundation/Foundation.h>

@protocol PBDCarouselCollectionViewLayoutPropertiesCache <NSObject>

/*
 * Content rect, considering content inset of collection view.
 */
@property(nonatomic, readonly) CGRect contentRect;

/*
 * Point on x axis that defines where actual content starts, considering size and content inset of collection view
 */
@property(nonatomic, readonly) CGFloat contentStart;

#pragma mark - Obtaining Item Position

- (CGPoint)centerForItemAtIndexPath:(NSIndexPath *)indexPath;

- (CGPoint)centerForHeaderViewAtIndexPath:(NSIndexPath *)path;

@end
