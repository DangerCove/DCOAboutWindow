# Overview

`DCOAboutWindow` is a replacement for the standard About dialog. 

It adds the option to open acknowledgements and visit the website by clicking a button.

`screenshot on the way`

# Setup

## Via [cocoapods](http://cocoapods.org)

I'll add the pod to the cocoapods library. As soon as it's accepted you can use:

    pod 'DCOAboutWindow'

While it hasn't been added add the following line to your Podfile:

    pod 'DCOAboutWindow', :git => 'git@github.com:DangerCove/DCOAboutWindow.git'

Then run `pod install` and you're set.

## Manually

Clone this repo and add files from `DCOAboutWindow` to your project.

# Usage

Import `DCOAboutWindowController`:

    #import <DCOAboutWindow/DCOAboutWindowController.h>

Instantiate and open `DCOAboutWindow`:

    // Note: make sure self.aboutWindowController is retained
    self.aboutWindowController = [DCOAboutWindow alloc] init];
    [self.aboutWindowController showWindow:nil];

You can change values by setting properties on `DCOAboutWindowController`:

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
     *  Default: [[NSBundle mainBundle] pathForResource:@"Credits" ofType:@"rtf"];
     */
    @property (copy) NSAttributedString *appCredits;

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

# Contributions and things to add

Be creative.

# License

New BSD License, see `LICENSE` for details.
