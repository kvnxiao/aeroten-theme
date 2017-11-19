# Aeroten Theme for Linux
A pixel-perfect copy of Windows 10's flat Metro / Fluent Design theme for Linux.

<p align="center">
  <img src="https://raw.githubusercontent.com/kvnxiao/aeroten-theme/master/preview/preview.png">
</p>

## Overview

Currently includes the "Steel Blue" accent colour theme from Windows 10 for window borders and buttons.

## Installing

Releases can be found in the [release section](https://github.com/kvnxiao/aeroten-theme/releases) online.

To manually build and install the metacity .xml file from the templating source file which uses Pug, you will 
need `yarn` and `make` installed.

1. Clone the repository to your drive
2. Run `make dep` to install the node modules
3. Run `make install` to install the theme

And to uninstall, simply run `make uninstall` to uninstall the theme

## Roadmap

- [ ] Add more Gtk+ customizations (e.g. Chromium Gtk+ decorations support)
- [ ] Include a customizable program or installer that allows users to choose their accent colours, including light or dark theme detection to allow a dynamic change in text colour for legibility.
