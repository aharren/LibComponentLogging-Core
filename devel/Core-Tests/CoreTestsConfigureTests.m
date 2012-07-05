//
//
// CoreTestsConfigureTests.m
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


@interface CoreTestsConfigureTests : SenTestCase {
    
}

@end


@implementation CoreTestsConfigureTests

- (void)setUp {
    lcl_configure_by_component(lcl_cMain, lcl_vOff);
    lcl_configure_by_component(lcl_cMainComponent1, lcl_vOff);
    lcl_configure_by_component(lcl_cMainComponent2, lcl_vOff);
    lcl_configure_by_component(lcl_cMain2, lcl_vOff);
}

- (void)testConfigureByComponent {
    int configured = 0;
    
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_component(lcl_cMain, (_lcl_component_t)-1);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace, nil);
    STAssertEquals(configured, 1, nil);
    
    configured = lcl_configure_by_component(lcl_cMain, 99);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace, nil);
    STAssertEquals(configured, 1, nil);
    
    configured = lcl_configure_by_component(lcl_cMain, lcl_vInfo);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_component(lcl_cMainComponent1, lcl_vDebug);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_component(lcl_cMain2, lcl_vCritical);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vCritical, nil);
}

- (void)testConfigureByIdentifier {
    int configured = 0;
    
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_identifier("Main", (_lcl_component_t)-1);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace, nil);
    
    configured = lcl_configure_by_identifier("Main", 99);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace, nil);
    
    configured = lcl_configure_by_identifier(NULL, lcl_vTrace);
    STAssertEquals(configured, 0, nil);
    
    configured = lcl_configure_by_identifier("", lcl_vTrace);
    STAssertEquals(configured, 0, nil);
    
    configured = lcl_configure_by_identifier("Main", lcl_vInfo);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_identifier("MainComponent2", lcl_vDebug);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_identifier("Main2", lcl_vCritical);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vCritical, nil);
}

- (void)testConfigureByIdentifierWithWildcardSuffix {
    int configured = 0;
    
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_identifier("MainC*", lcl_vDebug);
    STAssertEquals(configured, 2, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_identifier("Main*", lcl_vTrace);
    STAssertEquals(configured, 4, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vTrace, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vTrace, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vTrace, nil);
}

- (void)testConfigureByHeader {
    int configured = 0;
    
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_header("main", (_lcl_component_t)-1);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace, nil);
    
    configured = lcl_configure_by_header("main", 99);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace, nil);
    
    configured = lcl_configure_by_header(NULL, lcl_vTrace);
    STAssertEquals(configured, 0, nil);
    
    configured = lcl_configure_by_header("", lcl_vTrace);
    STAssertEquals(configured, 0, nil);
    
    configured = lcl_configure_by_header("main", lcl_vInfo);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_header("main.component2", lcl_vDebug);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_header("main2", lcl_vCritical);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vCritical, nil);
}

- (void)testConfigureByHeaderWithWildcardSuffix {
    int configured = 0;
    
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_header("main.*", lcl_vDebug);
    STAssertEquals(configured, 2, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
}

- (void)testConfigureByName {
    int configured = 0;
    
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_name("Main", (_lcl_component_t)-1);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace, nil);
    
    configured = lcl_configure_by_name("Main", 99);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace, nil);
    
    configured = lcl_configure_by_name(NULL, lcl_vTrace);
    STAssertEquals(configured, 0, nil);
    
    configured = lcl_configure_by_name("", lcl_vTrace);
    STAssertEquals(configured, 0, nil);
    
    configured = lcl_configure_by_name("Main", lcl_vInfo);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_name("Main/Component2", lcl_vDebug);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_name("Main2", lcl_vCritical);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vCritical, nil);
}

- (void)testConfigureByNameWithWildcardSuffix {
    int configured = 0;
    
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff, nil);
    
    configured = lcl_configure_by_name("Main*", lcl_vInfo);
    STAssertEquals(configured, 4, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vInfo, nil);
    
    configured = lcl_configure_by_name("Main/*", lcl_vDebug);
    STAssertEquals(configured, 2, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vInfo, nil);
    
    configured = lcl_configure_by_name("Main/Component1*", lcl_vError);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vError, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vInfo, nil);
    
    configured = lcl_configure_by_name("Main2*", lcl_vCritical);
    STAssertEquals(configured, 1, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vError, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vCritical, nil);
    
    configured = lcl_configure_by_name("*", lcl_vTrace);
    STAssertEquals(configured, 4, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vTrace, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vTrace, nil);
    STAssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vTrace, nil);
}

@end

