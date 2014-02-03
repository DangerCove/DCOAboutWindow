# Overview

`DCOAboutWindow` is a replacement for the standard About dialog. 

It adds the option to open acknowledgements and visit the website by clicking a button.

![DCOAboutWindow in action](https://raw.github.com/DangerCove/DCOAboutWindow/master/screenshots/DCOAboutWindow.jpg)

# Setup

## Via [cocoapods](http://cocoapods.org)

Add the following line to your Podfile:

    pod 'DCOAboutWindow'

Then run `pod install` and you're set.

## Manually

Clone this repo and add files from `DCOAboutWindow` to your project.

# Usage

I've made [sample project](https://github.com/DangerCove/DCOAboutWindowExample) that accompanies this tiny guide.

Import `DCOAboutWindowController`:

    #import <DCOAboutWindow/DCOAboutWindowController.h>

Instantiate `DCOAboutWindow`:

    // Note: make sure self.aboutWindowController is retained
    self.aboutWindowController = [DCOAboutWindow alloc] init];

Create an IBAction to display the window:

    - (IBAction)showAboutWindow:(id)sender {
      [self.aboutWindowController showWindow:nil];
    }

Hook it up to the 'About [app name]' menu item or a button.

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
