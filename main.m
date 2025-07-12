#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface SudoAskPassController : NSObject
{
    NSWindow *window;
    NSSecureTextField *passwordField;
    NSTextField *promptLabel;
    NSButton *okButton;
    NSButton *cancelButton;
    BOOL cancelled;
}

- (void)showPasswordDialog;
- (void)okClicked:(id)sender;
- (void)cancelClicked:(id)sender;
- (void)applicationDidFinishLaunching:(NSNotification *)notification;

@end

@implementation SudoAskPassController

- (id)init
{
    self = [super init];
    if (self) {
        cancelled = NO;
    }
    return self;
}

- (void)showPasswordDialog
{
    // Create window
    NSRect windowRect = NSMakeRect(100, 100, 400, 150);
    window = [[NSWindow alloc] initWithContentRect:windowRect
                                         styleMask:NSTitledWindowMask | NSClosableWindowMask
                                           backing:NSBackingStoreBuffered
                                             defer:NO];
    
    [window setTitle:@"Sudo Password"];
    [window center];
    
    // Create prompt label
    NSRect promptRect = NSMakeRect(20, 90, 360, 30);
    promptLabel = [[NSTextField alloc] initWithFrame:promptRect];
    [promptLabel setStringValue:@"Enter your password for sudo:"];
    [promptLabel setBezeled:NO];
    [promptLabel setDrawsBackground:NO];
    [promptLabel setEditable:YES];
    [promptLabel setSelectable:YES];
    [[window contentView] addSubview:promptLabel];
    
    // Create password field
    NSRect passwordRect = NSMakeRect(20, 60, 360, 22);
    passwordField = [[NSSecureTextField alloc] initWithFrame:passwordRect];
    [[window contentView] addSubview:passwordField];
    
    // Create Cancel button
    NSRect cancelRect = NSMakeRect(220, 20, 80, 30);
    cancelButton = [[NSButton alloc] initWithFrame:cancelRect];
    [cancelButton setTitle:@"Cancel"];
    // [cancelButton setBezelStyle:NSBezelStyleRounded];
    [cancelButton setTarget:self];
    [cancelButton setAction:@selector(cancelClicked:)];
    [cancelButton setKeyEquivalent:@"\033"];
    [[window contentView] addSubview:cancelButton];
    
    // Create OK button
    NSRect okRect = NSMakeRect(310, 20, 80, 30);
    okButton = [[NSButton alloc] initWithFrame:okRect];
    [okButton setTitle:@"OK"];
    // [okButton setBezelStyle:NSBezelStyleRounded];
    [okButton setTarget:self];
    [okButton setAction:@selector(okClicked:)];
    [okButton setKeyEquivalent:@"\r"];
    [[window contentView] addSubview:okButton];
    
    // Show window and make it key
    [window makeKeyAndOrderFront:nil];
    [window makeFirstResponder:passwordField];
}

- (void)okClicked:(id)sender
{
    NSString *password = [passwordField stringValue];
    if (password && [password length] > 0) {
        printf("%s\n", [password UTF8String]);
        fflush(stdout);
    }
    [NSApp terminate:nil];
}

- (void)cancelClicked:(id)sender
{
    cancelled = YES;
    [NSApp terminate:nil];
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    [self showPasswordDialog];
}

- (void)dealloc
{
    [window release];
    [passwordField release];
    [promptLabel release];
    [okButton release];
    [cancelButton release];
    [super dealloc];
}

@end

int main(int argc, const char * argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // Initialize the application
    NSApplication *app = [NSApplication sharedApplication];
    
    // Create and set the delegate
    SudoAskPassController *controller = [[SudoAskPassController alloc] init];
    [app setDelegate:controller];
    
    // Run the application
    [app run];
    
    [controller release];
    [pool drain];
    
    return 0;
}
