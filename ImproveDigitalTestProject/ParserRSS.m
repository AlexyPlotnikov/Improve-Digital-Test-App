//
//  ParserRSS.m
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 06.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import "ParserRSS.h"


@implementation ParserRSS{
    RSSPost *post;
    NSMutableArray *feeds;
    NSXMLParser *parserRSS;
    NSString *element;
    NSMutableString *currentValue;
    NSString *err;
}

-(id)initWithURL:(NSString*)urlString{
    if(self=[super init]){
        feeds = [NSMutableArray new];
        NSURL *url = [NSURL URLWithString:urlString];
        parserRSS = [[NSXMLParser alloc] initWithContentsOfURL:url];
        parserRSS.delegate=self;
    }
    return self;
    
}

-(void)parse:(CallbackParse)callback onError:(ErrorParse)error{
   
    if(err){
        error(err);
    }else{
        [parserRSS setShouldResolveExternalEntities:NO];
        [parserRSS parse];
        callback(feeds);
    }
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    err = [NSString stringWithFormat:
           @"Error %ld, Description: %@",
           (long)[parseError code],
           [[parser parserError] localizedDescription]];
}

-(void)parserDidStartDocument:(NSXMLParser *)parser{
    [self.delegate parseDidStartOrEnd:YES];
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    [self.delegate parseDidStartOrEnd:NO];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
  
    if ( [elementName isEqualToString:@"item"] ) {
        post = [[RSSPost alloc] init];
        return;
        
    }else if ([elementName isEqualToString:@"title"] || [elementName isEqualToString:@"link"] || [elementName isEqualToString:@"description"] || [elementName isEqualToString:@"pubDate"]) {
        element = elementName;
        return;
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if (!currentValue) {
        currentValue = [[NSMutableString alloc] init];
    }
    [currentValue appendString:string];
    NSString *trimmedString = [currentValue
stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    [currentValue setString:trimmedString];
   
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ([elementName isEqualToString:@"item"]) {
        [feeds addObject:post];
        post=nil;
        return;
    }else if ([elementName isEqualToString:element]){
        [post setValue:currentValue forProperty:element];
    }
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"pubDate" ascending:FALSE];
    [feeds sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    currentValue=nil;
}

@end
