//
//  NetworkService.m
//  CAVFlickr
//
//  Created by Александр on 12/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "NetworkService.h"
#import "NetworkHelper.h"

@implementation NetworkService

- (void)findFlickrPhotoWithSearchString:(NSString *)searchSrting : (NSInteger) page andAmount: (NSInteger) amount : (void (^) (NSDictionary *data)) success andFailure : (void (^) (NSInteger code)) failure
{
    NSURL *url = [NetworkHelper URLForSearchString:searchSrting :page andAmount:amount];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:15];
    
    NSURLSession *session;
    session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != NULL)
        {
            NSDictionary *temp = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            success(temp);
        }
        else
        {
            failure(error.code);
        }
    }];
    [sessionDataTask resume];
}

@end

