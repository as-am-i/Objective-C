//
//  main.m
//  Objective_c_assignement_1
//
//  Created by 谷井朝美 on 2018-04-16.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ManipulateStrings:NSObject
/* method declaration */
- (void)sentenceUppercase:(NSString *)originalStr;
- (void)sentenceLowercase:(NSString *)originalStr;
- (void)sentenceNumberize:(NSString *)originalStr;
- (void)sentenceCanadianize:(NSString *)originalStr;
- (void)sentenceRespond:(NSString *)originalStr;
- (void)sentenceDeSpaceIt:(NSString *)originalStr;
- (void)sentenceCount:(NSString *)originalStr;
@end


@implementation ManipulateStrings
- (void)sentenceUppercase:(NSString *)originalStr{
    NSString *result = [originalStr uppercaseString];
    NSLog(@"Result is: %@", result);
}
- (void)sentenceLowercase:(NSString *)originalStr{
    NSString *result = [originalStr lowercaseString];
    NSLog(@"Result is: %@", result);
}

- (void)sentenceNumberize:(NSString *)originalStr{
    NSScanner *scanner = [NSScanner scannerWithString:originalStr];
    int integer = 0;
    if([scanner scanInt:&integer] && [scanner isAtEnd])
    {
        int result = [originalStr intValue];
        NSLog(@"Result is: %d", result);
    } else {
         NSLog(@"Invalid input to convert to a number: %@", originalStr);
    }
}

- (void)sentenceCanadianize:(NSString *)originalStr{
    NSString *str = [originalStr stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSString *result = [str stringByAppendingString:@", eh?"];
    NSLog(@"%@", result);
}

- (void)sentenceRespond:(NSString *)originalStr{
    // I need to cut off the new line at the end of the string
    NSString *str = [originalStr stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    if ([str hasSuffix:@"?"]) {
//    if ([[originalStr substringFromIndex:[originalStr length] - 1] isEqualToString:@"?"]) {
         NSLog(@"I don't know");
//    } else if ([[originalStr substringFromIndex:[originalStr length] - 1] isEqualToString:@"!"]) {
    } else if ([str hasSuffix:@"!"]) {
         NSLog(@"Whoa, calm down!");
    }
}

- (void)sentenceDeSpaceIt:(NSString *)originalStr{
    NSString *result = [originalStr stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    NSLog(@"Result is: %@", result);
}

- (void)sentenceCount:(NSString *)originalStr{
    NSString *str = [originalStr stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSLog(@"Length of this string is: %zd", [str length]);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        char inputChars[255];
        printf("Input a string: ");
        fgets(inputChars, 255, stdin);
        // convert char array to an NSString object
        NSString *inputString = [NSString stringWithUTF8String:inputChars];
        
        // let user choose options
        char inputInteger[32];
        int option = 0;
        int numbers = 8;
        
        // create an instance of ManipulateStrings
        ManipulateStrings *manipulateString = [[ManipulateStrings alloc]init];
        
        char *options[200] = {"Uppercase", "Lowercase", "Numberize", "Canadianize", "Respond", "De-Space-It", "Count", "Exit App"};
        printf("\n");
        while (option != 8) {
            for (int i = 0; i < numbers; ++i)
            {
                printf("%d.%s\n", i + 1, options[i]);
            }
            printf("Enter your option: ");
            fgets(inputInteger, 32, stdin);
            option = atoi(inputInteger);
            
            switch (option) {
                case 1:
                    [manipulateString sentenceUppercase:inputString];
                    break;
                case 2:
                    [manipulateString sentenceLowercase:inputString];
                    break;
                case 3:
                    [manipulateString sentenceNumberize:inputString];
                    break;
                case 4:
                    [manipulateString sentenceCanadianize:inputString];
                    break;
                case 5:
                    [manipulateString sentenceRespond:inputString];
                    break;
                case 6:
                    [manipulateString sentenceDeSpaceIt:inputString];
                    break;
                case 7:
                    [manipulateString sentenceCount:inputString];
                    break;
                case 8:
                    printf("Bye bye!\n");
                    break;
                default:
                    break;
            }
        }
    }
    return 0;
}
