# Theos Jailed

To begin developing your first jailed tweak, head over to [Installation](https://github.com/kabiroberai/theos-jailed/wiki/Installation) in the wiki.

## Features

* Works with the latest and greatest
    - iOS 8 and up
    with your choice of:
    - CydiaSubstrate.framework
    OR
    - Latest [Substitute](https://apt.bingner.com/info/com.ex.substitute/.)
* Functions as a module, so it plugs in to Theos. This means you can always use the latest version of Theos with it
* Colored terminal output (see [Example output](#example-output))
* Uses `make package install` instead of a shell script --- just like in jailbroken tweaks
* Improved codesigning
    - You don't need to ever specify `DEV_CERT_NAME`
    - Supports both bundle IDs and .mobileprovision files
    - **Doesn't require a paid developer account!**
* Integrates with `ios-deploy` to automatically install the app onto a connected device
* Tweak more than just code. Theos Jailed allows custom
    - Bundle IDs
    - Display names
    - `Info.plist` files (merged with the app's `Info.plist`)
    - Resources (merged with the app's root directory)
* Includes various addons
    - Cycript
    - FLEX
    - Fishhook
* Adds its own template to Theos without overwriting any existing Theos code
    - This means that you can build jailed and jailbroken tweaks at the same time
* Supports building Extensify Exos
* Provides an easy way to integrate Dynamic Frameworks/Libraries
* Lets you inject Cydia tweaks into the target app (doesn't work with all tweaks)
* Adds `make troubleshoot-jailed` for helping with issues
* Extensively documented on the [wiki](https://github.com/kabiroberai/theos-jailed/wiki)

## Linux
Added some support for (Arch) linux.
Requires:
* cctools (check AUR or you distro. also available here: [cctools-port](https://github.com/tpoechtrager/cctools-port))
* [insert_dylib](https://github.com/LeanVel/insert_dylib) ( install script will attempt to install it).
* [plutiil/plistutil](https://github.com/libimobiledevice/libplist) (install script will attempt to install for Arch).

## Example output
<img src="http://i.imgur.com/zBQY7ec.png" width="750">

## Credits

* [BishopFox](https://github.com/BishopFox/theos-jailed) for the original proof of concept
