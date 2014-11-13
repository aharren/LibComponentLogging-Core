//
//
// CoreTestsConfigureTests.m
//
//
// Copyright (c) 2008-2014 Arne Harren <ah@0xc0.de>
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
#import "TestCase.h"


@interface CoreTestsConfigureTests : TestCase {
    
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
    
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_component(lcl_cMain, (_lcl_component_t)-1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace);
    AssertEquals(configured, 1);
    
    configured = lcl_configure_by_component(lcl_cMain, 99);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace);
    AssertEquals(configured, 1);
    
    configured = lcl_configure_by_component(lcl_cMain, lcl_vInfo);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_component(lcl_cMainComponent1, lcl_vDebug);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_component(lcl_cMain2, lcl_vCritical);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vCritical);
}

- (void)testConfigureByIdentifier {
    int configured = 0;
    
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_identifier("Main", (_lcl_component_t)-1);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace);
    
    configured = lcl_configure_by_identifier("Main", 99);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace);
    
    configured = lcl_configure_by_identifier(NULL, lcl_vTrace);
    AssertEquals(configured, 0);
    
    configured = lcl_configure_by_identifier("", lcl_vTrace);
    AssertEquals(configured, 0);
    
    configured = lcl_configure_by_identifier("Main", lcl_vInfo);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_identifier("MainComponent2", lcl_vDebug);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_identifier("Main2", lcl_vCritical);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vCritical);
}

- (void)testConfigureByIdentifierWithWildcardSuffix {
    int configured = 0;
    
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_identifier("MainC*", lcl_vDebug);
    AssertEquals(configured, 2);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_identifier("Main*", lcl_vTrace);
    AssertEquals(configured, 4);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vTrace);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vTrace);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vTrace);
}

- (void)testConfigureByHeader {
    int configured = 0;
    
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_header("main", (_lcl_component_t)-1);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace);
    
    configured = lcl_configure_by_header("main", 99);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace);
    
    configured = lcl_configure_by_header(NULL, lcl_vTrace);
    AssertEquals(configured, 0);
    
    configured = lcl_configure_by_header("", lcl_vTrace);
    AssertEquals(configured, 0);
    
    configured = lcl_configure_by_header("main", lcl_vInfo);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_header("main.component2", lcl_vDebug);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_header("main2", lcl_vCritical);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vCritical);
}

- (void)testConfigureByHeaderWithWildcardSuffix {
    int configured = 0;
    
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_header("main.*", lcl_vDebug);
    AssertEquals(configured, 2);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
}

- (void)testConfigureByName {
    int configured = 0;
    
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_name("Main", (_lcl_component_t)-1);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace);
    
    configured = lcl_configure_by_name("Main", 99);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace);
    
    configured = lcl_configure_by_name(NULL, lcl_vTrace);
    AssertEquals(configured, 0);
    
    configured = lcl_configure_by_name("", lcl_vTrace);
    AssertEquals(configured, 0);
    
    configured = lcl_configure_by_name("Main", lcl_vInfo);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_name("Main/Component2", lcl_vDebug);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_name("Main2", lcl_vCritical);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vCritical);
}

- (void)testConfigureByNameWithWildcardSuffix {
    int configured = 0;
    
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vOff);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vOff);
    
    configured = lcl_configure_by_name("Main*", lcl_vInfo);
    AssertEquals(configured, 4);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vInfo);
    
    configured = lcl_configure_by_name("Main/*", lcl_vDebug);
    AssertEquals(configured, 2);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vInfo);
    
    configured = lcl_configure_by_name("Main/Component1*", lcl_vError);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vError);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vInfo);
    
    configured = lcl_configure_by_name("Main2*", lcl_vCritical);
    AssertEquals(configured, 1);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vInfo);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vError);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vDebug);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vCritical);
    
    configured = lcl_configure_by_name("*", lcl_vTrace);
    AssertEquals(configured, 4);
    AssertEquals((int)_lcl_component_level[lcl_cMain], lcl_vTrace);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent1], lcl_vTrace);
    AssertEquals((int)_lcl_component_level[lcl_cMainComponent2], lcl_vTrace);
    AssertEquals((int)_lcl_component_level[lcl_cMain2], lcl_vTrace);
}

@end

