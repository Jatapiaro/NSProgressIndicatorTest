//
//  AppDelegate.m
//  ProgressIndicatorTesting
//
//  Created by Jacobo Tapia on 9/24/20.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (weak, nonatomic) IBOutlet NSProgressIndicator *progressIndicator;
@property (weak, nonatomic) IBOutlet NSTextField *progress;

@end

@implementation AppDelegate
{
    NSTimer *_timer;
}

- (void)awakeFromNib
{
    _progressIndicator.minValue = 0;
    _progressIndicator.maxValue = 1000;
    _progressIndicator.doubleValue = 500;
    _progressIndicator.usesThreadedAnimation = YES;
    _progressIndicator.controlSize = NSControlSizeSmall;
    _progressIndicator.style = NSProgressIndicatorStyleBar;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)startDownload:(NSButton *)sender
{
    if (_timer)
        return;

    _timer = [NSTimer timerWithTimeInterval:0.3 repeats:YES block:^(NSTimer *timer) {
        double value = self->_progressIndicator.doubleValue;
        self->_progressIndicator.doubleValue = value + 1;
        self->_progress.stringValue = [NSString stringWithFormat:@"%f out of 1000", value];
    }];
    sender.hidden = YES;
}

@end
