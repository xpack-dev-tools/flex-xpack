
[![GitHub package.json version](https://img.shields.io/github/package-json/v/xpack-dev-tools/flex-xpack)](https://github.com/xpack-dev-tools/flex-xpack/blob/xpack/package.json)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/xpack-dev-tools/flex-xpack)](https://github.com/xpack-dev-tools/flex-xpack/releases/)
[![npm (scoped)](https://img.shields.io/npm/v/@xpack-dev-tools/flex.svg?color=blue)](https://www.npmjs.com/package/@xpack-dev-tools/flex/)
[![license](https://img.shields.io/github/license/xpack-dev-tools/flex-xpack)](https://github.com/xpack-dev-tools/flex-xpack/blob/xpack/LICENSE)

# The xPack GNU flex

A standalone cross-platform (macOS/Linux) **GNU flex**
binary distribution, intended for reproducible builds.

The main target is macOS 10.13, whose older version of this utility
fails some builds.

In addition to the the binary archives and the package meta data,
this project also includes the build scripts.

## Overview

This open source project is hosted on GitHub as
[`xpack-dev-tools/flex-xpack`](https://github.com/xpack-dev-tools/flex-xpack)
and provides the platform specific binaries for the
[xPack GNU flex](https://xpack.github.io/flex/).

This distribution follows the official
[GNU flex](https://www.gnu.org/software/flex/) releases.

The binaries can be installed automatically as **binary xPacks** or manually as
**portable archives**.

## Release schedule

This distribution is generally one minor release behind the upstream releases.
In practical terms, when the minor release number changes, it awaits a few
more weeks to get the latest patch release.

## User info

This section is intended as a shortcut for those who plan
to use the GNU flex binaries. For full details please read the
[xPack GNU flex](https://xpack.github.io/flex/) pages.

### Easy install

The easiest way to install GNU flex is using the **binary xPack**, available as
[`@xpack-dev-tools/flex`](https://www.npmjs.com/package/@xpack-dev-tools/flex)
from the [`npmjs.com`](https://www.npmjs.com) registry.

#### Prerequisites

A recent [xpm](https://xpack.github.io/xpm/),
which is a portable [Node.js](https://nodejs.org/) command line application
that complements [npm](https://docs.npmjs.com)
with several extra features specific to
**C/C++ projects**.

It is recommended to install/update to the latest version with:

```sh
npm install --location=global xpm@latest
```

For details please follow the instructions in the
[xPack install](https://xpack.github.io/install/) page.

#### Install

With the `xpm` tool available, installing
the latest version of the package and adding it as
a development dependency for a project is quite easy:

```sh
cd my-project
xpm init # Add a package.json if not already present

xpm install @xpack-dev-tools/flex@latest --verbose

ls -l xpacks/.bin
```

This command will:

- install the latest available version,
into the central xPacks store, if not already there
- add symbolic links to the central store
(or `.cmd` forwarders on Windows) into
the local `xpacks/.bin` folder.

The central xPacks store is a platform dependent
location in the home folder;
check the output of the `xpm` command for the actual
folder used on your platform.
This location is configurable via the environment variable
`XPACKS_STORE_FOLDER`; for more details please check the
[xpm folders](https://xpack.github.io/xpm/folders/) page.

It is also possible to install GNU flex globally, in the user home folder:

```sh
xpm install --global @xpack-dev-tools/flex@latest --verbose
```

After install, the package should create a structure like this (macOS files;
only the first two depth levels are shown):

```console
$ tree -L 2 /Users/ilg/Library/xPacks/\@xpack-dev-tools/flex/2.6.4-1.1/.content/
/Users/ilg/Library/xPacks/\@xpack-dev-tools/flex/2.6.4-1.1/.content/
├── README.md
├── bin
│   ├── bison
│   └── yacc
├── distro-info
│   ├── CHANGELOG.md
│   ├── licenses
│   └── scripts
├── libexec
│   └── libiconv.2.dylib
└── share
    ├── aclocal
    └── bison

9 directories, 5 files
```

No other files are installed in any system folders or other locations.

#### Uninstall

The binaries are distributed as portable archives; thus they do not need
to run a setup and do not require an uninstall; simply removing the
folder is enough.

To remove the links created by xpm in the current project:

```sh
cd my-project

xpm uninstall @xpack-dev-tools/flex
```

To completely remove the package from the central xPack store:

```sh
xpm uninstall --global @xpack-dev-tools/flex
```

### Manual install

For all platforms, the **xPack GNU flex**
binaries are released as portable
archives that can be installed in any location.

The archives can be downloaded from the
GitHub [Releases](https://github.com/xpack-dev-tools/flex-xpack/releases/)
page.

For more details please read the
[Install](https://xpack.github.io/flex/install/) page.

### Versioning

The version strings used by the GNU flex project are three number strings
like `2.6.4`, which looks like semver;
to this string the xPack distribution adds a four number,
but since semver allows only three numbers, all additional ones can
be added only as pre-release strings, separated by a dash,
like `2.6.4-1`. When published as a npm package, the version gets
a fifth number, like `2.6.4-1.1`.

Since adherence of third party packages to semver is not guaranteed,
it is recommended to use semver expressions like `^2.6.4` and `~2.6.4`
with caution, and prefer exact matches, like `2.6.4-1.1`.

## Maintainer info

For maintainer info, please see the
[README-MAINTAINER](https://github.com/xpack-dev-tools/flex-xpack/blob/xpack/README-MAINTAINER.md).

## Support

The quick advice for getting support is to use the GitHub
[Discussions](https://github.com/xpack-dev-tools/flex-xpack/discussions/).

For more details please read the
[Support](https://xpack.github.io/flex/support/) page.

## License

Unless otherwise stated, the content is released under the terms of the
[MIT License](https://opensource.org/licenses/mit/),
with all rights reserved to
[Liviu Ionescu](https://github.com/ilg-ul).

The binary distributions include several open-source components; the
corresponding licenses are available in the installed
`distro-info/licenses` folder.

## Download analytics

- GitHub [`xpack-dev-tools/flex-xpack`](https://github.com/xpack-dev-tools/flex-xpack/) repo
  - latest xPack release
[![Github All Releases](https://img.shields.io/github/downloads/xpack-dev-tools/flex-xpack/latest/total.svg)](https://github.com/xpack-dev-tools/flex-xpack/releases/)
  - all xPack releases [![Github All Releases](https://img.shields.io/github/downloads/xpack-dev-tools/flex-xpack/total.svg)](https://github.com/xpack-dev-tools/flex-xpack/releases/)
  - [individual file counters](https://somsubhra.github.io/github-release-stats/?username=xpack-dev-tools&repository=flex-xpack) (grouped per release)
- npmjs.com [`@xpack-dev-tools/flex`](https://www.npmjs.com/package/@xpack-dev-tools/flex/) xPack
  - latest release, per month
[![npm (scoped)](https://img.shields.io/npm/v/@xpack-dev-tools/flex.svg)](https://www.npmjs.com/package/@xpack-dev-tools/flex/)
[![npm](https://img.shields.io/npm/dm/@xpack-dev-tools/flex.svg)](https://www.npmjs.com/package/@xpack-dev-tools/flex/)
  - all releases [![npm](https://img.shields.io/npm/dt/@xpack-dev-tools/flex.svg)](https://www.npmjs.com/package/@xpack-dev-tools/flex/)

Credit to [Shields IO](https://shields.io) for the badges and to
[Somsubhra/github-release-stats](https://github.com/Somsubhra/github-release-stats)
for the individual file counters.
