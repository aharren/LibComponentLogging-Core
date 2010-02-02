# LibComponentLogging-Core

[http://0xc0.de/LibComponentLogging](http://0xc0.de/LibComponentLogging)    
[http://github.com/aharren/LibComponentLogging-Core](http://github.com/aharren/LibComponentLogging-Core)

## Overview

LibComponentLogging is a small open source logging library for Objective-C
applications on Mac OS X and the iPhone OS which provides conditional logging
based on log levels and log components. Additionally, different logging
strategies can be used, e.g. writing log messages to a file or sending them to
the system log, while using the same logging interface.

LibComponentLogging is available under the terms of the MIT license.

This Git repository contains the library's Core part.

## Repository Branches

The Git repository contains the following branches:

* [master](http://github.com/aharren/LibComponentLogging-Core/tree/master):
  The *master* branch contains stable builds of the main logging code
  which are tagged with version numbers.

* [devel](http://github.com/aharren/LibComponentLogging-Core/tree/devel):
  The *devel* branch is the development branch for the logging code
  which contains an Xcode project and unit tests. The code in this branch is
  not stable.

## Related Repositories

The following Git repositories are related to this repository: 

* [http://github.com/aharren/LibComponentLogging-LogFile](http://github.com/aharren/LibComponentLogging-LogFile):
  A file logging class which writes log messages to an application-specific log
  file.

* [http://github.com/aharren/LibComponentLogging-SystemLog](http://github.com/aharren/LibComponentLogging-SystemLog):
  A logging class which sends log messages to the Apple System Log facility (ASL).

* [http://github.com/aharren/LibComponentLogging-NSLog](http://github.com/aharren/LibComponentLogging-NSLog):
  A very simple logger which redirects log messages to NSLog, but adds
  information about the log level, the log component, and the log statement's
  location (file name and line number).
