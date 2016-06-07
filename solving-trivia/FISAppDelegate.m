//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSString *)solveTrivia {
   
    NSDictionary *statesAndCapitals = @{
                                        @"Washington":@"Olympia",@"Oregon":@"Salem",
                                        @"California":@"Sacramento",@"Ohio":@"Columbus",
                                        @"Nebraska":@"Lincoln",@"Colorado":@"Denver",
                                        @"Michigan":@"Lansing",@"Massachusetts":@"Boston",
                                        @"Florida":@"Tallahassee",@"Texas":@"Austin",
                                        @"Oklahoma":@"Oklahoma City",@"Hawaii":@"Honolulu",
                                        @"Alaska":@"Juneau",@"Utah":@"Salt Lake City",
                                        @"New Mexico":@"Santa Fe",@"North Dakota":@"Bismarck",
                                        @"South Dakota":@"Pierre",@"West Virginia":@"Charleston",
                                        @"Virginia":@"Richmond",@"New Jersey":@"Trenton",
                                        @"Minnesota":@"Saint Paul",@"Illinois":@"Springfield",
                                        @"Indiana":@"Indianapolis",@"Kentucky":@"Frankfort",
                                        @"Tennessee":@"Nashville",@"Georgia":@"Atlanta",
                                        @"Alabama":@"Montgomery",@"Mississippi":@"Jackson",
                                        @"North Carolina":@"Raleigh",@"South Carolina":@"Columbia",
                                        @"Maine":@"Augusta",@"Vermont":@"Montpelier",
                                        @"New Hampshire":@"Concord",@"Connecticut":@"Hartford",
                                        @"Rhode Island":@"Providence",@"Wyoming":@"Cheyenne",
                                        @"Montana":@"Helena",@"Kansas":@"Topeka",
                                        @"Iowa":@"Des Moines",@"Pennsylvania":@"Harrisburg",
                                        @"Maryland":@"Annapolis",@"Missouri":@"Jefferson City",
                                        @"Arizona":@"Phoenix",@"Nevada":@"Carson City",
                                        @"New York":@"Albany",@"Wisconsin":@"Madison",
                                        @"Delaware":@"Dover",@"Idaho":@"Boise",
                                        @"Arkansas":@"Little Rock",@"Louisiana":@"Baton Rouge"
                    };
    
    for (NSString *key in statesAndCapitals) {
        if ([self stringLetterCompareWithStringToSearch:key stringToLook:statesAndCapitals[key]]) {
            return key;
        }
    }
    return @"";
}

// method to compare two strings and return YES if there is no character match
-(BOOL)stringLetterCompareWithStringToSearch:(NSString *)stringToSearch stringToLook:(NSString *)stringToLook {
    //turn the strings to lowercase
    stringToSearch = [stringToSearch lowercaseString];
    stringToLook = [stringToLook lowercaseString];
    
    //create a mutable array with the characters in the strings - get rid of the whte space
    NSArray *wordsToSearch = [stringToSearch componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSMutableArray *mLettersToSearch = [wordsToSearch mutableCopy];
    
    for (NSString *word in wordsToSearch) {
        for (NSUInteger i = 0; i < [word length]; i++) {
            [mLettersToSearch addObject:[NSString stringWithFormat:@"%c",[word characterAtIndex:i]]];
        }
    }
    
    NSArray *wordsToLook = [stringToLook componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSMutableArray *mLettersToLook = [wordsToLook mutableCopy];
    
    for (NSString *word in wordsToLook) {
        for (NSUInteger i = 0; i < [word length]; i++) {
            [mLettersToLook addObject:[NSString stringWithFormat:@"%c",[word characterAtIndex:i]]];
        }
    }
    
    //compare each array's elements to see if there is a match. return the first string (dictionary key) when there is no character match (note that each character is a string)
    for (NSUInteger i=0; i < [mLettersToSearch count]; i++) {
        for (NSUInteger j=0; j < [mLettersToLook count]; j++) {
            if ([mLettersToSearch[i] isEqualToString:mLettersToLook[j]]) {
                return NO;
            }
        }
    }
    return YES;
}

@end
