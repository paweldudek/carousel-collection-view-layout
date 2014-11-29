//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//


#import "PBDCarouselCollectionViewLayout.h"

@interface PBDCarouselCollectionViewLayout ()
@property(nonatomic) CGFloat rightLeftMargin;
@property(nonatomic) CGFloat topBottomMargin;
@property(nonatomic, strong) NSIndexPath *indexPathForCenteredItem;
@end

@implementation PBDCarouselCollectionViewLayout

#pragma mark - Preparing Layout

- (void)prepareLayout {
    [super prepareLayout];

    CGSize collectionViewSize = self.collectionView.bounds.size;
    self.rightLeftMargin = (collectionViewSize.width - self.itemSize.width) / 2;
    self.topBottomMargin = (collectionViewSize.height - self.itemSize.height) / 2;
}

- (CGSize)collectionViewContentSize {
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];

    CGFloat contentWidth = numberOfItems * self.itemSize.width + (numberOfItems - 1) * self.interItemSpace + 2 * self.rightLeftMargin;
    CGFloat contentHeight = self.itemSize.height + 2 * self.topBottomMargin;

    return CGSizeMake(contentWidth, contentHeight);
}

#pragma mark - Attributes

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    CGFloat combinedItemWidth = self.itemSize.width + self.interItemSpace;

    CGFloat minimalXPosition = CGRectGetMinX(rect) - self.rightLeftMargin;
    CGFloat maximalXPosition = CGRectGetMaxX(rect) - self.rightLeftMargin;

    CGFloat firstVisibleItem = floorf(minimalXPosition / combinedItemWidth);
    CGFloat lastVisibleItem = ceilf(maximalXPosition / combinedItemWidth);

    if (firstVisibleItem < 0) {
        firstVisibleItem = 0;
    }

    if (lastVisibleItem > [[self collectionView] numberOfItemsInSection:0]) {
        lastVisibleItem = [[self collectionView] numberOfItemsInSection:0];
    }

    NSMutableArray *layoutAttributes = [NSMutableArray array];

    for (NSInteger j = (NSInteger) firstVisibleItem; j < lastVisibleItem; j++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:0];
        [layoutAttributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }

    return layoutAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [[[self class] layoutAttributesClass] layoutAttributesForCellWithIndexPath:indexPath];

    CGRect bounds = CGRectZero;
    bounds.size = self.itemSize;

    attributes.bounds = bounds;
    CGFloat x = self.rightLeftMargin + indexPath.row * (self.itemSize.width + self.interItemSpace) + self.itemSize.width / 2;
    CGFloat y = self.collectionView.frame.size.height / 2;
    attributes.center = CGPointMake(x, y);

    return attributes;
}

#pragma mark - Target Content Offset

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGPoint targetContentOffset = proposedContentOffset;
    UICollectionViewLayoutAttributes *layoutAttributesForItemToCenterOn = [self layoutAttributesForUserFingerMovingWithVelocity:velocity
                                                                                                          proposedContentOffset:proposedContentOffset];

    if (layoutAttributesForItemToCenterOn) {
        targetContentOffset.x = layoutAttributesForItemToCenterOn.center.x - self.collectionView.bounds.size.width / 2;
        targetContentOffset.y = 0;
        self.indexPathForCenteredItem = layoutAttributesForItemToCenterOn.indexPath;
    }

    return targetContentOffset;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset {
    UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:self.indexPathForCenteredItem];
    CGPoint targetContentOffset = proposedContentOffset;

    if (attributes) {
        targetContentOffset.x = attributes.center.x - self.collectionView.bounds.size.width / 2;
        targetContentOffset.y = 0;
    }

    return targetContentOffset;
}

#pragma mark - Helpers

- (UICollectionViewLayoutAttributes *)layoutAttributesForUserFingerMovingWithVelocity:(CGPoint)velocity proposedContentOffset:(CGPoint)offset {
    UICollectionViewLayoutAttributes *layoutAttributesForItemToCenterOn = nil;
    CGRect nextVisibleBounds = [self collectionView].bounds;
    nextVisibleBounds.origin = offset;
    NSArray *layoutAttributesInRect = [self layoutAttributesForElementsInRect:nextVisibleBounds];

    if (velocity.x > 0.0f) {
        layoutAttributesForItemToCenterOn = [layoutAttributesInRect lastObject];
    }
    else if (velocity.x < 0.0f) {
        layoutAttributesForItemToCenterOn = [layoutAttributesInRect firstObject];
    }
    else {
        CGFloat distanceToCenter = CGFLOAT_MAX;

        for (UICollectionViewLayoutAttributes *attributes in layoutAttributesInRect) {
            CGFloat midOfFrame = CGRectGetMidX(self.collectionView.frame);
            CGFloat center = self.collectionView.contentOffset.x + midOfFrame;

            CGFloat distance = ABS(center - attributes.center.x);

            if (distance < distanceToCenter) {
                distanceToCenter = distance;
                layoutAttributesForItemToCenterOn = attributes;
            }
        }
    }

    return layoutAttributesForItemToCenterOn;
}

#pragma mark - Invalidating Layout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return !CGSizeEqualToSize(self.collectionView.bounds.size, newBounds.size);
}

#pragma mark - Overriden Setters

- (void)setItemSize:(CGSize)itemSize {
    if (!CGSizeEqualToSize(_itemSize, itemSize)) {
        _itemSize = itemSize;
        [self invalidateLayout];
    }
}

@end
