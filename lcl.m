//
//
// lcl.m -- LibComponentLogging
//
//
// Copyright (c) 2008-2009 Arne Harren <ah@0xc0.de>
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
#include <string.h>


// Active log levels, indexed by log component.
_lcl_level_narrow_t _lcl_component_level[_lcl_component_t_count];

// Log component headers, indexed by log component.
const char * const _lcl_component_header[] = {
#   define  _lcl_component(_identifier, _header, _name)                        \
    _header,
#   include "lcl_config_components.h"
#   undef   _lcl_component
};

// Log component names, indexed by log component.
const char * const _lcl_component_name[] = {
#   define  _lcl_component(_identifier, _header, _name)                        \
    _name,
#   include "lcl_config_components.h"
#   undef   _lcl_component
};

// Log level headers, indexed by log level.
const char * const _lcl_level_header[] = {
    "-",
    "CRITICAL",
    "ERROR",
    "WARNING",
    "INFO",
    "DEBUG",
    "TRACE"
};
const char * const _lcl_level_header_1[] = {
    "-",
    "C",
    "E",
    "W",
    "I",
    "D",
    "T"
};
const char * const _lcl_level_header_3[] = {
    "---",
    "CRI",
    "ERR",
    "WRN",
    "INF",
    "DBG",
    "TRC"
};

// Log level names, indexed by log level.
const char * const _lcl_level_name[] = {
    "Off",
    "Critical",
    "Error",
    "Warning",
    "Info",
    "Debug",
    "Trace"
};

// Version.
#define __lcl_version_to_string( _text) __lcl_version_to_string0(_text)
#define __lcl_version_to_string0(_text) #_text
const char * const _lcl_version = __lcl_version_to_string(_LCL_VERSION_MAJOR) 
                              "." __lcl_version_to_string(_LCL_VERSION_MINOR)
                              "." __lcl_version_to_string(_LCL_VERSION_BUILD);

// Configures the given log level for the given log component.
uint32_t lcl_configure_by_component(_lcl_component_t component, _lcl_level_t level) {
    uint32_t count = 0;
    if (level <= _lcl_level_t_last && component <= _lcl_component_t_last) {
        _lcl_component_level[component] = level;
        count++;
    }
    return count;
}

// Configures the given log level for the given log component(s).
uint32_t lcl_configure_by_name(const char *name, _lcl_level_t level) {
    uint32_t count = 0;
    if (level <= _lcl_level_t_last && name != NULL && name[0] != '\0') {
        size_t name_len = strlen(name);
        if (name[name_len-1] == '*') {
            name_len--;
            for (_lcl_component_t c = _lcl_component_t_first; c <= _lcl_component_t_last; c++) {
                if (strncmp(name, _lcl_component_name[c], name_len) == 0) {
                    _lcl_component_level[c] = level;
                    count++;
                }
            }
        } else {
            for (_lcl_component_t c = _lcl_component_t_first; c <= _lcl_component_t_last; c++) {
                if (strcmp(name, _lcl_component_name[c]) == 0) {
                    _lcl_component_level[c] = level;
                    count++;
                }
            }
        }
    }
    return count;
}
