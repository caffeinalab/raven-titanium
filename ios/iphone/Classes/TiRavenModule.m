/**
 * raven-titanium
 *
 * Created by Flavio De Stefano
 * Copyright (c) 2015 Caffeina. All rights reserved.
 */

#import "TiRavenModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation TiRavenModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"b68017aa-e479-4bfe-87ce-9e641dd85f78";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.raven";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
}

#pragma Public APIs

-(void)initialize:(id)args
{
    ENSURE_SINGLE_ARG(args, NSString);

    [RavenClient setSharedClient:[RavenClient clientWithDSN:args]];
    [[RavenClient sharedClient] setupExceptionHandler];

    NSLog(@"Raven is ready");
}

-(void)log:(id)args
{
    ENSURE_SINGLE_ARG(args, NSString);
    RavenCaptureMessage(args);
}

@end
