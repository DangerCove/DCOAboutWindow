//
//  DCOAboutWindowController.h
//  Tapetrap
//
//  Created by Boy van Amstel on 20-01-14.
//  Copyright (c) 2014 Danger Cove. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/**
 *  The about window.
 */
@interface DCOAboutWindowController : NSWindowController

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
 *  The credits file name
 *  Default: File in mainBuindle with name "credits"
 */
@property (copy) NSString *appCreditsFileName;

/*
 *  The credits file type.
 *  Default: File in mainBunde with extension "rtf"
 */
@property (copy) NSString *appCreditsFileType;

/**
 *  The URL pointing to the app's website.
 *  Default: none
 */
@property (strong) NSURL *appWebsiteURL;

/**
 *  The path to the file that contains the acknowledgements.
 *  Default: [[NSBundle mainBundle] pathForResource:@"Acknowledgements" ofType:@"rtf"];
 */
@property (nonatomic, copy) NSString *acknowledgementsPath;

/**
 *  Visit the website.
 *
 *  @param sender The object making the call.
 */
- (IBAction)visitWebsite:(id)sender;

/**
 *  Show acknowledgements for libraries used etc.
 *
 *  @param sender The object making the call.
 */
- (IBAction)showAcknowledgements:(id)sender;

@end
