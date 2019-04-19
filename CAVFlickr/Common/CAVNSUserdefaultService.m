//
//  CAVNSUserdefaultService.m
//  CAVFlickr
//
//  Created by Александр on 19.04.2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "CAVNSUserdefaultService.h"

@interface CAVNSUserdefaultService()

@property (nonatomic, strong) NSUserDefaults* userDefaults;

@end

@implementation CAVNSUserdefaultService

-(instancetype) init
{
	if (self = [super init])
	{
		self.userDefaults = [NSUserDefaults new];
	}
	
	return self;
}

-(void)saveSearcString: (NSString *) searchString
{
	[self.userDefaults setObject:searchString forKey:@"searchStringKey"];
}

-(NSString *)getSearchString
{
	return [self.userDefaults stringForKey:@"searchStringKey"];
}

@end
