# Overview

DCOAboutWindow is a replacement for the standard About dialog. 

It adds the option to open acknowledgments and visit the website by clicking a button.

![DCOAboutWindow in action](https://raw.github.com/DangerCove/DCOAboutWindow/master/screenshots/DCOAboutWindow.jpg)

## Showing acknowledgments

You can point to and maintain a custom `Acknowledgments.rtf` file, or you can use a script like [Acknowledge](https://github.com/DangerCove/Acknowledge) to generate it for you.

# Changelog

## v0.0.2

* Switched to using 'Acknowledgments' instead of 'Acknowledg_e_ments' to be more consistent and prevent incompatibility with [Acknowledge](https://github.com/DangerCove/Acknowledge). **NOTE:** Make sure you change the filename of your acknowledgments and any setters/getters.

## v0.0.1

* Initial release.

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
     *  The path to the file that contains the acknowledgments. 
     *  Default: [[NSBundle mainBundle] pathForResource:@"Acknowledgments" ofType:@"rtf"];
     */
    @property (nonatomic, copy) NSString *acknowledgmentsPath;



# Contributions and things to add

Be creative. DCOAboutWindow should be a flexible, easy to use way to make the About Window for your app look pretty. Make sure your changes don't break existing functionality without good reason.

## Spin-offs

Let me know if you made far going modifications by including your project in this section. Add yourself to the list and send me a pull request.

* [Your project on GitHub](http://www.dangercove.com) - A short description.

## Add-ons

Related apps, tools and scripts that extend DCOAboutWindow's functionality.

* [Acknowledge](https://github.com/DangerCove/Acknowledge) - Generates a single `Acknowledgments.rtf` from Cocoapods and custom markdown files.

# License

New BSD License, see `LICENSE` for details.
