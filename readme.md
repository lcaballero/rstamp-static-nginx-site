[![Build Status](https://travis-ci.org/lcaballero/rstamp-static-nginx-site.svg?branch=master)](https://travis-ci.org/) [![NPM version](https://badge.fury.io/js/rstamp-static-nginx-site.svg)](http://badge.fury.io/js/rstamp-static-nginx-site)

# Introduction

Simply put: this creates a directory structure with a new nginx.conf
file and a few stubbed files.  With this directory and nginx one can
stand up a static http server.

## Installation

### Prerequisite Tools

- [Node][node]
- [nginx][nginx]
- [rstamp-cli][rstamp-cli]
- [bower][bower]
- [brew][brew] (optional way of installing nginx).

Once the prerequisite tools are installed you can then install the
static nginx site generator.  It should be noted that after these
steps you'll also be setup to install and run other rstamp generators.

```
%> npm install -g rstamp-static-nginx-site
```

## Usage

At this point you can quickly create a new nginx site in a new
location.  Create a location to place the site:

```
%> cd ~/tmp
%> mkdir my-site && cd $_
```

Now generate the site:

```
%> rstamp --generate static-nginx-site
... inquirer.js questions ...
... the defaults site will be in my-site/ and run on port 8080 ...
%> ./start.sh
%> gulp build
%> ./open.sh
%> gulp watch
```

The script generates the list of files and directories shown below.

```
.
├── app
│   ├── css
│   ├── html
│   │   └── index.html
│   ├── images
│   └── js
├── bower_components
├── node_modules
├── gulpfile.coffee
├── logs
├── conf
│   └── nginx.conf
├── open.sh
├── src
│   ├── scripts
│   └── styles
└── start.sh

```

The directory bower_componenets includes angular and node_modules
includes gulp, which comes with tasks build and watch.  Build will
transpile any coffee or stylus in src/ to the app/css and app/js
directories respectively.  The build task also copies from
bower_components the angular dependency.

The script ./start.sh starts the nginx server.  If the server is
already running it might first need to be killed to pick up the
nginx.conf, or you could run it manually by using:

```
%> nginx -s reload -c [absolute-path-to]/nginx.conf
```

After you've started the server you should generate the css and js
with `gulp build`, then open up a browser pointing at
`http://localhost:8080/html` (of course, use your own custom port if
it's not the default).

You could also use the script ./open.sh which does the same thing from
the command line (on Mac).  Follow this up with `gulp watch`, which
will watch for changes to your src/scripts and src/styles file and
transpile any coffee or stylus files there to the appropriate app/js
or app/css directory.

The project comes with very minimal example just to prove all the
moving parts are working together.


## License

See license file.

The use and distribution terms for this software are covered by the
[Eclipse Public License 1.0][EPL-1], which can be found in the file
'license' at the root of this distribution. By using this software in
any fashion, you are agreeing to be bound by the terms of this
license. You must not remove this notice, or any other, from this
software.


[EPL-1]: http://opensource.org/licenses/eclipse-1.0.txt
[node]: http://nodejs.org/
[nginx]: http://nginx.org/en/download.html
[brew]: http://brew.sh/
[brew-nginx]: http://learnaholic.me/2012/10/10/installing-nginx-in-mac-os-x-mountain-lion/
[rstamp-cli]: https://github.com/lcaballero/rstamp-cli
[bower]: http://bower.io/#install-bower
