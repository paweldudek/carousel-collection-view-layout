//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PBDCarouselCollectionViewLayout : UICollectionViewLayout

@property(nonatomic) CGSize itemSize IBInspectable;

/*
 * Space between items in collection view. 
 *
 * Defaults to 0;
 */
@property(nonatomic) CGFloat interItemSpace IBInspectable;
/*
 * Settings this to non-nil value will enable collection header view. Header view is laid out before first item in collection view.
 * It does not participate in centering, aka you cannot center collection view on it.
 *
 * Defaults to CGSizeZero;
 *
 */
@property(nonatomic) CGSize headerSize IBInspectable;

/*
 * Settings this to non-nil value will enable collection footer view. Footer view is laid out after first item in collection view.
 * It does not participate in centering, aka you cannot center collection view on it.
 *
 * Defaults to CGSizeZero;
 *
 */
@property(nonatomic) CGSize footerSize IBInspectable;

@end
