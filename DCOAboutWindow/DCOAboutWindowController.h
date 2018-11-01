//
//  DCOAboutWindowController.h
//  Tapetrap
//
//  Created by Boy van Amstel on 20-01-14.
//  Copyright (c) 2014 Danger Cove. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/**
 *  When DCOAboutWindow loads resources from the bundle, these delegate methods
 *  will be called, enabling pre-processing of text prior to display. Potential
 *  applications include:
 *  - Re-coloring an NSAttributedString with named colors, because RTF only supports
 *    hard-coded colors. This enables automatic support for different appearances, such
 *    as Dark Mode in macOS 10.14+.
 *  - String substitution, for example, for displaying framework version information
 *    in the text in the about window.
 */
@protocol DCOStringPreprocessingProtocol

/**
 *	Given the credits loaded from the bundle, expects a modified version
 *  to be used in return.
 */
- (NSAttributedString *)preprocessAppCredits:(NSAttributedString *)appCredits;

@optional
/**
 *    Given the acknowledgments loaded from the bundle, expects a modified version
 *  to be used in return.
 */
- (NSAttributedString *)preprocessAppAcknowledgments:(NSAttributedString *)appAcknowledgments;

@end

/**
 *  The about window.
 */
@interface DCOAboutWindowController : NSWindowController

/**
 *  The delegate for the window controller.
 *  Default: nil
 */
@property (nonatomic,weak) id delegate;

/**
 *  The application name.
 *  Default: CFBundleName
 */
@property (copy) NSString *appName;

/**
 *  The application version.
 *  Default: "Version %@ (Build %@)", CFBundleVersion, CFBundleShortVersionString
 */
@property (copy) NSString *appVersion;

/**
 *  The copyright line.
 *  Default: NSHumanReadableCopyright
 */
@property (copy) NSString *appCopyright;

/**
 *  The credits.
 *  Default: contents of file at [[NSBundle mainBundle] pathForResource:@"Credits" ofType:@"rtf"];
 */
@property (copy) NSAttributedString *appCredits;

/**
 *  The URL pointing to the app's website.
 *  Default: none
 */
@property (strong) NSURL *appWebsiteURL;

/**
 *  The path to the file that contains the acknowledgments.
 *  Default: [[NSBundle mainBundle] pathForResource:@"Acknowledgments" ofType:@"rtf"];
 */
@property (nonatomic, copy) NSString *acknowledgmentsPath;

/**
 *  If set to YES acknowledgments are shown in a text view, inside the window. Otherwise an external editor is launched.
 *  Default: NO;
 */
@property (assign) BOOL useTextViewForAcknowledgments;

/**
 *  Visit the website.
 *
 *  @param sender The object making the call.
 */
- (IBAction)visitWebsite:(id)sender;

/**
 *  Show acknowledgments for libraries used etc.
 *
 *  @param sender The object making the call.
 */
- (IBAction)showAcknowledgments:(id)sender;

@end
