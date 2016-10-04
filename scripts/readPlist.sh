#!/bin/sh

export LABEL_ID=b`/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" CIiOSExampleApp/info.plist`
echo $LABEL_ID
