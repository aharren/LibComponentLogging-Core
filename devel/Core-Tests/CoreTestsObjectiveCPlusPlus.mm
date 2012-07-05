//
//
// CoreTestsObjectiveCPlusPlus.mm
//
//
// Copyright (c) 2008-2012 Arne Harren <ah@0xc0.de>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "lcl.h"
#import <SenTestingKit/SenTestingKit.h>


class CoreTestsObjectiveCPlusPlusTestsClass {
    
public:
    static void configureByComponent();
    static void logAtLevelCritical();
    static void logAtLevelInfo();
    static void logAtLevelDebug();
    
};

void CoreTestsObjectiveCPlusPlusTestsClass::configureByComponent() {
    lcl_configure_by_component(lcl_cMain, lcl_vInfo);
    lcl_configure_by_component(lcl_cMainComponent1, lcl_vOff);
    lcl_configure_by_component(lcl_cMainComponent2, lcl_vOff);
    lcl_configure_by_component(lcl_cMain2, lcl_vOff);
}

void CoreTestsObjectiveCPlusPlusTestsClass::logAtLevelCritical() {
    lcl_log(lcl_cMain, lcl_vCritical, @"message %d", 1);
}

void CoreTestsObjectiveCPlusPlusTestsClass::logAtLevelInfo() {
    lcl_log(lcl_cMain, lcl_vInfo, @"message %d", 2);
}

void CoreTestsObjectiveCPlusPlusTestsClass::logAtLevelDebug() { 
    lcl_log(lcl_cMain, lcl_vDebug, @"message %d", 2);
}


@interface CoreTestsObjectiveCPlusPlusTests : SenTestCase {
    
}

@end


@implementation CoreTestsObjectiveCPlusPlusTests

- (void)setUp {
    [CoreTestsLogger reset];
}

- (void)testLoggingAtLogLevelInfo {
    CoreTestsObjectiveCPlusPlusTestsClass::configureByComponent();
    CoreTestsObjectiveCPlusPlusTestsClass::logAtLevelCritical();
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"CRITICAL main message 1", nil);
    CoreTestsObjectiveCPlusPlusTestsClass::logAtLevelInfo();
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"INFO main message 2", nil);
    CoreTestsObjectiveCPlusPlusTestsClass::logAtLevelDebug();
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"INFO main message 2", nil);
}

@end

