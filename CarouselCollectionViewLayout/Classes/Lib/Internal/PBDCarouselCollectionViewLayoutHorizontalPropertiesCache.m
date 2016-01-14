/*
 * Copyright (c) 2016 Pawel Dudek. All rights reserved.
 */
#import "PBDCarouselCollectionViewLayoutHorizontalPropertiesCache.h"
#import "PBDCarouselCollectionViewLayout.h"


@interface PBDCarouselCollectionViewLayoutHorizontalPropertiesCache ()
/*
 * Content rect, considering content inset of collection view.
 */
@property(nonatomic, readwrite) CGRect contentRect;

/*
 * Point on x axis that defines where actual content starts, considering size and content inset of collection view
 */
@property(nonatomic, readwrite) CGFloat contentStart;

@property(nonatomic) CGFloat cellYPosition;

@end

@implementation PBDCarouselCollectionViewLayoutHorizontalPropertiesCache

- (instancetype)initWithLayout:(PBDCarouselCollectionViewLayout *)layout {
    self = [super init];
    if (self) {
        _layout = layout;

        [self calculateLayoutProperties];
    }

    return self;
}

#pragma mark - Calculating Layout Properties

- (void)calculateLayoutProperties {
    UICollectionView *collectionView = self.layout.collectionView;

    CGSize collectionViewSize = collectionView.bounds.size;
    CGFloat rightLeftMargin = (collectionViewSize.width - self.layout.itemSize.width) / 2;
    CGFloat topBottomMargin = (collectionViewSize.height - self.layout.itemSize.height) / 2;

    NSInteger numberOfItems = [collectionView numberOfItemsInSection:0];

    // Content rect will be the actual content minus collection view insets
    CGFloat contentWidth = numberOfItems * self.layout.itemSize.width + (numberOfItems - 1) * self.layout.interItemSpace + 2 * rightLeftMargin;
    CGFloat contentHeight = self.layout.itemSize.height + 2 * topBottomMargin;

    CGRect contentRect = CGRectMake(0, 0, contentWidth, contentHeight);
    self.contentRect = UIEdgeInsetsInsetRect(contentRect, collectionView.contentInset);

    self.contentStart = rightLeftMargin;
    self.cellYPosition = CGRectGetMidY(self.contentRect) - collectionView.contentInset.top;
}

#pragma mark - Center Calculation

- (CGPoint)centerForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat x = self.contentStart + indexPath.row * (self.layout.itemSize.width + self.layout.interItemSpace) + self.layout.itemSize.width / 2;
    return CGPointMake(x, self.cellYPosition);
}

- (CGPoint)centerForHeaderViewAtIndexPath:(NSIndexPath *)indexPath {
    NSIndexPath *firstSectionItem = [NSIndexPath indexPathForItem:0 inSection:indexPath.section];
    CGPoint firstItemCenter = [self centerForItemAtIndexPath:firstSectionItem];
    firstItemCenter.x -= self.layout.itemSize.width / 2.0f + self.layout.interItemSpace + self.layout.headerSize.width / 2.0f;
    return CGPointMake(firstItemCenter.x, self.cellYPosition);
}

@end
