/**
 * raven-titanium
 *
 * Created by Flavio De Stefano
 * Copyright (c) 2015 Caffeina. All rights reserved.
 */

#import "TiExceptionHandler+EventLogging.h"
#import "TiApp.h"
#import "TiAppiOSProxy.h"
#import "TiRavenModule.h"

@implementation TiExceptionHandler (EventLogging)

- (void)reportScriptError:(TiScriptError *)scriptError
{
    NSLog(@"[ERROR] Script Error: %@", [scriptError description]);
    RavenCaptureMessage([scriptError description]);
}

@end
