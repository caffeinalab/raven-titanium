/**
 * raven-titanium
 *
 * Created by David Bankier on 17/06/2014.
 * Edited by Flavio De Stefano
 * Copyright (c) 2015 Caffeina. All rights reserved.
 */

#import "TiExceptionHandler+EventLogging.h"
#import "TiApp.h"
#import "TiAppiOSProxy.h"
#import "RavenClient.h"

@implementation TiExceptionHandler (EventLogging)

- (void)reportScriptError: (TiScriptError*)ex
{
    NSLog(@"[ERROR] %@ (Raven)", ex.detailedDescription);
    if ([RavenClient sharedClient] == nil) return;
    
    [[RavenClient sharedClient]
        captureMessage: ex.message
        level: kRavenLogLevelDebugError
        method: "JS"
        file: [ex.sourceURL UTF8String]
        line: [NSNumber numberWithInteger:ex.lineNo]
    ];
}

@end
