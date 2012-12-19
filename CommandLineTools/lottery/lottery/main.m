//
//  main.m
//  lottery
//
//  Created by Ryan Clark on 12/19/12.
//  Copyright (c) 2012 Ryan Clark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotteryEntry.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDate *now = [[NSDate alloc] init];
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSDateComponents *weekComponents = [[NSDateComponents alloc]init];
        
    
        srandom((unsigned)time(NULL));
        NSMutableArray *array;
        array = [[NSMutableArray alloc] init];
        
        int i;
        for (i = 0; i < 10; i++) {
            
            [weekComponents setWeek:i];
            
            NSDate *iWeeksFromNow;
            iWeeksFromNow = [cal dateByAddingComponents:weekComponents
                                                 toDate:now
                                                options:0];
            
            LotteryEntry *newEntry = [[LotteryEntry alloc] init];
            [newEntry prepareRandomNumbers];
            [newEntry setEntryDate:iWeeksFromNow];
            
            [array addObject:newEntry];
            
        }
        
        for (LotteryEntry *entryToPrint in array    ) {
            NSLog(@"%@", entryToPrint);
        }
    }
    return 0;
}
