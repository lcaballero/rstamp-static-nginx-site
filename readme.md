[![Build Status](https://travis-ci.org/lcaballero/rstamp-static-nginx-site.svg?branch=master)](https://travis-ci.org/) [![NPM version](https://badge.fury.io/js/rstamp-static-nginx-site.svg)](http://badge.fury.io/js/rstamp-static-nginx-site)

# Introduction

Simply put: this creates a directory structure with a new nginx.conf file and a
few stubbed files.  With this directory and nginx one can stand
up a static http server.

## Installation

`nginx` and `node` are required to use this package.  Both are easy to find
and install.  [Node installer][node] and [nginx][nginx] (or install `nginx`
using [brew][brew] and the [nginx brew installation][brew-nginx].


```
%> npm install -g rstamp-static-nginx-site
```

## Usage

```
%> rstamp --generate static-nginx-site
... inquirer.js questions ...
%> ./start.sh
%> ./open.sh
```

This command will ask for the location and port number to setup the site.
Once it runs there will be an app/ and logs/ directory along with nginx.conf
file.  Included by the generator are two scripts, `start.sh` and `open.sh`.
The start script will start nginx using the nginx.conf file, and open will
open a browser tab/window pointing at the root directory (on Mac).

## License

See license file.

The use and distribution terms for this software are covered by the
[Eclipse Public License 1.0][EPL-1], which can be found in the file 'license' at the
root of this distribution. By using this software in any fashion, you are
agreeing to be bound by the terms of this license. You must not remove this
notice, or any other, from this software.


[EPL-1]: http://opensource.org/licenses/eclipse-1.0.txt
[node]: http://nodejs.org/
[nginx]: http://nginx.org/en/download.html
[brew]: http://brew.sh/
[brew-nginx]: http://learnaholic.me/2012/10/10/installing-nginx-in-mac-os-x-mountain-lion/