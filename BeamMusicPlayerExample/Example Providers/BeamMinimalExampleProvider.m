//
//  BeamMinimalExampleProvider.m
//  BeamMusicPlayerExample
//
//  Created by Moritz Haarmann on 01.06.12.
//  Copyright (c) 2012 n/a. All rights reserved.
//

#import "BeamMinimalExampleProvider.h"

@implementation BeamMinimalExampleProvider

-(NSString*)musicPlayer:(BeamMusicPlayerViewController *)player albumForTrack:(NSUInteger)trackNumber {
    return @"Example Album that is very long and therefore needs scrolling";
}

-(NSString*)musicPlayer:(BeamMusicPlayerViewController *)player artistForTrack:(NSUInteger)trackNumber {
    return @"Cim Tooks and the Pineapples";
}

-(NSString*)musicPlayer:(BeamMusicPlayerViewController *)player titleForTrack:(NSUInteger)trackNumber {
    return @"If the Foo sings bar, it makes me wanna baz.";
}

-(CGFloat)musicPlayer:(BeamMusicPlayerViewController *)player lengthForTrack:(NSUInteger)trackNumber {
    return 125;
}

-(NSUInteger)numberOfTracksInPlayer:(BeamMusicPlayerViewController *)player {
    return 3;
}

-(void)musicPlayer:(BeamMusicPlayerViewController *)player artworkForTrack:(NSUInteger)trackNumber receivingBlock:(BeamMusicPlayerReceivingBlock)receivingBlock {
    NSString* url = @"http://a3.mzstatic.com/us/r1000/045/Features/7f/50/ee/dj.zygromnm.600x600-75.jpg";
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSData* urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        
        UIImage* image = [UIImage imageWithData:urlData];
        receivingBlock(image,nil);
    });
}

@end
