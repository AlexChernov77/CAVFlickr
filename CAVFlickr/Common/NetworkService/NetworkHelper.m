//
//  NetworkHelper.m
//  CAVFlickr
//
//  Created by Александр on 12/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "NetworkHelper.h"

@implementation NetworkHelper

+ (NSURL *)URLForSearchString:(NSString *)searchString : (NSInteger) page andAmount: (NSInteger) amount
{
    
    NSString *string = [searchString stringByReplacingOccurrencesOfString:@" " withString:@"," ];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:@"https://api.flickr.com/services/rest/"];
    NSURLQueryItem *method = [NSURLQueryItem queryItemWithName:@"method" value:@"flickr.photos.search"];
    NSURLQueryItem *apiKey = [NSURLQueryItem queryItemWithName:@"api_key" value:@"dab4052df3cc23ed39745a8cca163e0a"];
    NSURLQueryItem *allTags = [NSURLQueryItem queryItemWithName:@"tags" value:string];
    NSURLQueryItem *tagMode = [NSURLQueryItem queryItemWithName:@"tag_mode" value:@"all"];
    NSURLQueryItem *perpage = [NSURLQueryItem queryItemWithName:@"per_page" value:[NSString stringWithFormat:@"%li",(long)amount]];
    NSURLQueryItem *pageNum = [NSURLQueryItem queryItemWithName:@"page" value:[NSString stringWithFormat:@"%li",(long)page]];
    NSURLQueryItem *format = [NSURLQueryItem queryItemWithName:@"format" value:@"json"];
    NSURLQueryItem *imgFormat = [NSURLQueryItem queryItemWithName:@"extras" value:@"url_sq,url_m"];
    NSURLQueryItem *noCallBack = [NSURLQueryItem queryItemWithName:@"nojsoncallback" value:@"1"];
    NSURLQueryItem *safeMode = [NSURLQueryItem queryItemWithName:@"safe_search" value:@"1"];
    
    
    
    urlComponents.queryItems = @[method, apiKey, allTags, tagMode, format, pageNum, perpage, noCallBack, imgFormat, safeMode];
    
    return urlComponents.URL;
}

@end
