//
//  DCOAboutWindowController.m
//  Tapetrap
//
//  Created by Boy van Amstel on 20-01-14.
//  Copyright (c) 2014 Danger Cove. All rights reserved.
//

#import "DCOAboutWindowController.h"
#import "NSAttributedStringMarkdownParser.h"

@interface DCOAboutWindowController()

/** The window nib to load. */
+ (NSString *)nibName;

/** The info view. */
@property (weak) IBOutlet NSView *infoView;

/** The credits text view. */
@property (assign) IBOutlet NSTextView *creditsTextView;

/** The button that opens the app's website. */
@property (weak) IBOutlet NSButton *visitWebsiteButton;

/** The button that opens the acknowledgements. */
@property (weak) IBOutlet NSButton *acknowledgementsButton;

@end

@implementation DCOAboutWindowController

#pragma mark - Class Methods

+ (NSString *)nibName {
    return @"DCOAboutWindow";
}

#pragma mark - Overrides

- (id)init {
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
        self.appVersion = [NSString stringWithFormat:@"Version %@ (Build %@)", shortVersion, version];
    }
    
    // Set copyright
    if(!self.appCopyright) {
        self.appCopyright = [bundleDict objectForKey:@"NSHumanReadableCopyright"];
    }
    
    // Set "visit website" caption
    self.visitWebsiteButton.title = [NSString stringWithFormat:self.visitWebsiteButton.title, self.appName];
    
    // Set acknowledgements
    if(!self.acknowledgementsPath) {
        self.acknowledgementsPath = [[NSBundle mainBundle] pathForResource:@"Acknowledgements" ofType:@"rtf"];
    }
    
    
    // Set App Credits
    NSString *creditsPath;
    if (self.appCreditsFileName && self.appCreditsFileType) {
        creditsPath = [[NSBundle mainBundle] pathForResource:self.appCreditsFileName ofType:self.appCreditsFileType];
    } else {
        NSLog(@"DCOAboutWindowController: Error, please specify a file name and file path");
    }
    
    // Handle the case that the given file is markdown
    if ([self.appCreditsFileType isEqualToString:@"md"]) {
        NSString *markdown = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.appCreditsFileName ofType:self.appCreditsFileType]  encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"MD: %@", markdown);
        
        NSAttributedStringMarkdownParser *parser = [[NSAttributedStringMarkdownParser alloc] init];
        NSAttributedString* string = [parser attributedStringFromMarkdownString:markdown];
        
        [self.creditsTextView setEditable:YES];
        [self.creditsTextView insertText:string];
        [self.creditsTextView setEditable:NO];
    }
    
    // Handle the case that the given file is txt, rtf, doc or docx
    if ([self.appCreditsFileType isEqualToString:@"txt"] ||
        [self.appCreditsFileType isEqualToString:@"rtf"] ||
        [self.appCreditsFileType isEqualToString:@"doc"] ||
        [self.appCreditsFileType isEqualToString:@"docx"]) {
        NSAttributedString *creditsString = [[NSAttributedString alloc] initWithPath:creditsPath documentAttributes:nil];
        [self.creditsTextView setEditable:YES];
        [self.creditsTextView insertText:creditsString];
        [self.creditsTextView setEditable:NO];
        [self.creditsTextView setFont:[NSFont fontWithName:@"Lucida Grande" size:12]];
    }
    
    
    
    
    
    
    
    // Disable editing
    [self.creditsTextView setEditable:NO]; // Somehow IB checkboxes are not working
    //[self.creditsTextView setSelectable:NO]; // Somehow IB checkboxes are not working
    
    // Draw info view
    self.infoView.wantsLayer = YES;
    self.infoView.layer.backgroundColor = [NSColor whiteColor].CGColor;
    
    // Add border
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.borderColor = [NSColor grayColor].CGColor;
    bottomBorder.borderWidth = 1;
    bottomBorder.frame = CGRectMake(-1.f, .0f, CGRectGetWidth(self.infoView.frame) + 2.f, CGRectGetHeight(self.infoView.frame) + 1.f);
    [self.infoView.layer addSublayer:bottomBorder];
    
    
    //
    // Added by developer of the Generatr for Mac application
    //
    
    //NSString *markdown = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Credits" ofType:@"md"]  encoding:NSUTF8StringEncoding error:nil];
    
    //NSString *html = [MMMarkdown HTMLStringWithMarkdown:markdown error:nil];
    
    //NSError *error;
    //NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    //NSAttributedString *preview = [[NSAttributedString alloc] initWithData:[html dataUsingEncoding:NSUTF8StringEncoding] options:options documentAttributes:nil error:&error];
    
    //[self.creditsTextView setEditable:YES];
    //[self.creditsTextView insertText:preview];
    //[self.creditsTextView setEditable:NO];
    
    //[self.creditsTextView setFont:[NSFont fontWithName:@"Lucida Grande" size:12]];
    
    //self.creditsTextView.string = preview;
    
    
}

#pragma mark - Getters/Setters

- (void)setAcknowledgementsPath:(NSString *)acknowledgementsPath {
    _acknowledgementsPath = acknowledgementsPath;
    
    if(!acknowledgementsPath) {
        
        // Remove the button (and constraints)
        [self.acknowledgementsButton removeFromSuperview];
        
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

- (IBAction)showAcknowledgements:(id)sender {
    
    if(self.acknowledgementsPath) {
        
        // Load in default editor
        [[NSWorkspace sharedWorkspace] openFile:self.acknowledgementsPath];
        
    } else {
        NSLog(@"Error: couldn't load the acknowledgements file");
    }
}

@end
