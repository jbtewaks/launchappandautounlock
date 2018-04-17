
NSTimer *timer ;

%hook SpringBoard
//applicationDidFinishLaunching
-(void)applicationDidFinishLaunching: (id)application
{
        %orig;
	timer = [NSTimer scheduledTimerWithTimeInterval:60*2 target:self selector:@selector(checkHeart) userInfo:nil repeats:YES];
}

%new
- (void)checkHeart
{
	//定时检测微信是否开启
    [[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.tencent.xin" suspended:0];
}

%end

//qutolock
%hook SBLockScreenViewController
-(void)activate{

	%orig;

	[[%c(SBLockScreenManager) sharedInstance] unlockUIFromSource:0 withOptions:nil];
}
%end