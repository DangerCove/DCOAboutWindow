//
//  DCOBackgroundView.h
//  Balthisar Tidy
//
//  Created by Jim Derry on 8/29/18.
//  Copyright © 2018 Jim Derry. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface DCOBackgroundView : NSView

/**
 *  The view's background color.
 *  Default: [NSColor textBackgroundColor]
 */
@property (strong) NSColor *backgroundColor;

/**
 *  The view's trim color.
 *  Default: [NSColor windowFrameColor];
 */
@property (strong) NSColor *trimColor;

@end

NS_ASSUME_NONNULL_END
