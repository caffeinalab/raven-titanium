/**
 * raven-titanium
 *
 * Created by Flavio De Stefano
 * Copyright (c) 2015 Caffeina. All rights reserved.
 */

#import "TiExceptionHandler+Raven.h"
#import "TiApp.h"
#import "TiAppiOSProxy.h"
#import "RavenClient.h"

@implementation TiExceptionHandler (Raven)

- (void)reportScriptError: (TiScriptError*)ex
{
    NSLog(@"[ERROR] %@", ex.detailedDescription);
    
    if ([RavenClient sharedClient] == nil) return;
    [[RavenClient sharedClient]
        captureMessage: ex.message
        level: kRavenLogLevelDebugError
        method: "JS"
        file: [ex.sourceURL UTF8String]
        line: ex.lineNo
     
    ];
}

@end
