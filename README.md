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

The project relies on [DCOTransparentScroller](https://github.com/DangerCove/DCOTransparentScroller), so include that too.

# Usage

I've made [sample project](https://github.com/DangerCove/DCOAboutWindowExample) that accompanies this tiny guide.

Import `DCOAboutWindowController`:

    #import <DCOAboutWindow/DCOAboutWindowController.h>

Instantiate `DCOAboutWindow`:

    // Note: make sure self.aboutWindowController is retained
    self.aboutWindowController = [[DCOAboutWindowController alloc] init];
    // Set the Credits file information
    [self.aboutWindowController setAppCreditsFileName:@"credits"];
    [self.aboutWindowController setAppCreditsFileType:@"md"];


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
     *  The credits file name.
     *  Default: File in mainBuindle with name "credits"
     */
    @property (copy) NSAttributedString *appCreditsFileName;
    
    /**
     *  The credits file type
     *  Default: File in mainBunde with extension "rtf"
     */
     @property (copy) NSString *ppCreditsFileType;

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

Be creative. DCOAboutWindow should be a flexible, easy to use way to make the About Window for your app look pretty. Make sure your changes don't break existing functionality without good reason.

## Spin-offs

Let me know if you made far going modifications by including your project in this section. Add yourself to the list and send me a pull request.

* [Your project on GitHub](http://www.dangercove.com) - A short description.

# License

New BSD License, see `LICENSE` for details.
