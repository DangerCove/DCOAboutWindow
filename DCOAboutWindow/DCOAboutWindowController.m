//
//  DCOAboutWindowController.m
//  Tapetrap
//
//  Created by Boy van Amstel on 20-01-14.
//  Copyright (c) 2014 Danger Cove. All rights reserved.
//

#import "DCOAboutWindowController.h"

@interface DCOAboutWindowController()

/** The window nib to load. */
+ (NSString *)nibName;

/** The root view. */
@property (weak) IBOutlet NSView *placeHolderView;

/** The info view. */
@property (weak) IBOutlet NSView *infoView;

/** The acknowledgements view. */
@property (weak) IBOutlet NSView *acknowledgmentsView;

/** The credits text view. */
@property (assign) IBOutlet NSTextView *creditsTextView;

/** The acknowledgements text view. */
@property (assign) IBOutlet NSTextView *acknowledgmentsTextView;

/** The button that opens the app's website. */
@property (weak) IBOutlet NSButton *visitWebsiteButton;

/** The button that opens the acknowledgments. */
@property (weak) IBOutlet NSButton *acknowledgmentsButton;

/** The string to hold the acknowledgements if we're showing them in same window. */
@property (copy) NSAttributedString *appAcknowledgments;

@end

@implementation DCOAboutWindowController

#pragma mark - Class Methods

+ (NSString *)nibName {
    return @"DCOAboutWindow";
}

#pragma mark - Overrides

- (id)init {

	// Set default for acknowledgmentsUseEditor
	_acknowledgmentsUseEditor = YES;

    return [super initWithWindowNibName:[[self class] nibName]];
}

- (void)windowDidLoad {

    // Load variables
    NSDictionary *bundleDict = [[NSBundle mainBundle] infoDictionary];

    // Set app name
    if(!self.appName) {
        self.appName = [bundleDict objectForKey:@"CFBundleName"];
    }

    // Set app version
    if(!self.appVersion) {
        NSString *version = [bundleDict objectForKey:@"CFBundleVersion"];
        NSString *shortVersion = [bundleDict objectForKey:@"CFBundleShortVersionString"];
        self.appVersion = [NSString stringWithFormat:NSLocalizedString(@"Version %@ (Build %@)", @"Version %@ (Build %@), displayed in the about window"), shortVersion, version];
    }

    // Set copyright
    if(!self.appCopyright) {
        self.appCopyright = [bundleDict objectForKey:@"NSHumanReadableCopyright"];
    }

    // Set "visit website" caption
    self.visitWebsiteButton.title = [NSString stringWithFormat:NSLocalizedString(@"Visit the %@ Website", @"Caption on the 'Visit the %@ Website' button in the about window"), self.appName];
    // Set the "acknowledgements" caption
    self.acknowledgmentsButton.title = NSLocalizedString(@"Acknowledgments", @"Caption of the 'Acknowledgments' button in the about window");

    // Set acknowledgments
    if(!self.acknowledgmentsPath) {
        self.acknowledgmentsPath = [[NSBundle mainBundle] pathForResource:@"Acknowledgments" ofType:@"rtf"];
    }

    // Set credits
    if(!self.appCredits) {
        NSString *creditsPath = [[NSBundle mainBundle] pathForResource:@"Credits" ofType:@"rtf"];
        self.appCredits = [[NSAttributedString alloc] initWithPath:creditsPath documentAttributes:nil];
    }

    // Disable editing
    [self.creditsTextView setEditable:NO]; // Somehow IB checkboxes are not working
//    [self.creditsTextView setSelectable:NO]; // Somehow IB checkboxes are not working

    // Draw info view
    self.infoView.wantsLayer = YES;
    self.infoView.layer.backgroundColor = [NSColor whiteColor].CGColor;

    // Add border
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.borderColor = [NSColor grayColor].CGColor;
    bottomBorder.borderWidth = 1;
    bottomBorder.frame = CGRectMake(-1.f, .0f, CGRectGetWidth(self.infoView.frame) + 2.f, CGRectGetHeight(self.infoView.frame) + 1.f);
    bottomBorder.autoresizingMask = NSViewHeightSizable | NSViewWidthSizable;
    [self.infoView.layer addSublayer:bottomBorder];
}

- (void)showWindow:(id)sender {

	[super showWindow:sender];

	// Show default infoView
	[self showView:self.infoView];

}

#pragma mark - Getters/Setters

- (void)setAcknowledgmentsPath:(NSString *)acknowledgmentsPath {
    _acknowledgmentsPath = acknowledgmentsPath;

    if(!acknowledgmentsPath) {

        // Remove the button (and constraints)
        [self.acknowledgmentsButton removeFromSuperview];

    } else if (!self.acknowledgmentsUseEditor) {

		self.appAcknowledgments = [[NSAttributedString alloc] initWithPath:acknowledgmentsPath documentAttributes:nil];

	}
}

#pragma mark - Interface Methods

- (IBAction)visitWebsite:(id)sender {

    if(self.appWebsiteURL) {
        [[NSWorkspace sharedWorkspace] openURL:self.appWebsiteURL];
    } else {
        NSLog(@"Error: please set the appWebsiteURL property on the about window");
    }

}

- (IBAction)showAcknowledgments:(id)sender {

	if(self.acknowledgmentsUseEditor) {

		if(self.acknowledgmentsPath) {

			// Load in default editor
			[[NSWorkspace sharedWorkspace] openFile:self.acknowledgmentsPath];

		} else {
			NSLog(@"Error: couldn't load the acknowledgments file");
		}
	} else {

		// toggle between the infoView and the ackknowledgmentsView
		if ([self.placeHolderView subviews][0] == self.infoView) {
			[self showView:self.acknowledgmentsView];
			self.acknowledgmentsButton.title = NSLocalizedString(@"Credits", nil);
		} else {

			[self showView:self.infoView];
			self.acknowledgmentsButton.title = NSLocalizedString(@"Acknowledgements", nil);
		}
	}
}

#pragma mark - Private Methods

- (void)showView:(NSView*)theView {

	for(NSView *subview in self.placeHolderView.subviews) {
		[subview removeFromSuperview];
	}

	//localView.frame = self.placeHolderView.frame;
	[self.placeHolderView addSubview:theView];
	[self.placeHolderView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[theView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(theView)]];
	[self.placeHolderView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[theView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(theView)]];

	// Draw info view
	theView.wantsLayer = YES;
	theView.layer.backgroundColor = [NSColor whiteColor].CGColor;

	// Add border
	CALayer *bottomBorder = [CALayer layer];
	bottomBorder.borderColor = [NSColor grayColor].CGColor;
	bottomBorder.borderWidth = 1;
	bottomBorder.frame = CGRectMake(-1.f, .0f, CGRectGetWidth(theView.frame) + 2.f, CGRectGetHeight(theView.frame) + 1.f);
	[theView.layer addSublayer:bottomBorder];

}

@end
