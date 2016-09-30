#!/bin/sh
# sign-and-upload.sh
# XcodeTravis
#
# Created by V2Solutions on 16/03/15.
# Copyright (c) 2014 ___v2Tech Ventures___. All rights reserved.
# http://www.objc.io/issue-6/travis-ci.html


# APP_BUILD_ENV : To configure the build scheme environment for defining the app build path
APP_BUILD_ENV=""

# HOCKEY_APP_ID & HOCKEY_APP_TOKEN : To configure the Hockey App Id and Token for uploading the build
HOCKEY_APP_TOKEN=""
HOCKEY_APP_ID=""
export OUTPUT_FILE_NAME='./release_notes/V2 - LT - MyLendingTree - iOS-'
export LABEL_ID=''
export ALL_STORIES_WITH_ID=''

# Condition which defines the Build Env used and based on that selection of the Hockey App Id and Hockey App token
if ([ "$TRAVIS_BRANCH"  = "master" ]); then
    APP_BUILD_ENV=DEV;
    HOCKEY_APP_ID=$DEV_HOCKEY_APP_ID;
    HOCKEY_APP_TOKEN=$DEV_HOCKEY_APP_TOKEN;
    echo "DEV Scheme Selected.";
else
    echo "No deployment will be done."
    exit 0
fi

# PROVISIONING_PROFILE : Provition profile selction
PROVISIONING_PROFILE="$HOME/Library/MobileDevice/Provisioning Profiles/$PROFILE_NAME.mobileprovision"

# OUTPUTDIR: App build path
OUTPUTDIR="$PWD/build/$APP_BUILD_ENV-iphoneos"

echo "***************************"
echo "* Signing *"
echo "***************************"

# command to package the appliacation and create the .ipa file
xcrun -log -sdk iphoneos PackageApplication "$OUTPUTDIR/$APP_NAME.app" -o "$OUTPUTDIR/$APP_NAME.ipa" -sign "$DEVELOPER_NAME" -embed "$PROVISIONING_PROFILE"

RELEASE_DATE='date '+%Y-%m-%d %H:%M:%S''

# 'b is label prefix coded as standard prefix for all project'
if [ ! -z "$INFOPLIST_FILE" ]; then
LABEL_ID=b`/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" "$INFOPLIST_FILE"`
echo " $INFOPLIST_FILE => Label ID ="$LABEL_ID
fi

# Only for Feature branch testing, Just replace the feature branch name
#if ([ "$TRAVIS_BRANCH"  = "95122662-Hockey_App_Release_Notes" ]); then
#LABEL_ID=b217
#echo "95122662-Hockey_App_Release_Notes - Label ID ="$LABEL_ID
#fi

OUTPUT_FILE_NAME="$OUTPUT_FILE_NAME$LABEL_ID"


# Condition to check the stories file is avaialable in release path
# If file is available then read the text from the file
if ([ -f "$OUTPUT_FILE_NAME" ]); then
    ALL_STORIES_WITH_ID=`cat "$OUTPUT_FILE_NAME"`
else
    echo "Error : File not found on path $OUTPUT_FILE_NAME .."
fi


RELEASE_NOTES="$ALL_STORIES_WITH_ID <br> Travis Integration Build: $TRAVIS_BUILD_NUMBER"

echo $RELEASE_NOTES

# Condition to upload the build on the Hockey App
# If app build .ipa avaialble on the specified build path,then upload the .ipa and .dysm.zip on Hockey App
# else showing the appropriate message on Travis log

if ([ -f "$OUTPUTDIR/$APP_NAME.ipa" ]); then
    if [ ! -z "$HOCKEY_APP_ID" ] && [ ! -z "$HOCKEY_APP_TOKEN" ]; then
        echo ""
        echo "***************************"
        echo "* Uploading to Hockeyapp *"
        echo "***************************"
        curl \
        -F "status=2" \
        -F "notify=0" \
        -F "notes=$RELEASE_NOTES" \
        -F "notes_type=0" \
        -F "ipa=@$OUTPUTDIR/$APP_NAME.ipa" \
        -F "dsym=@$OUTPUTDIR/$APP_NAME.app.dsym.zip" \
        -H "X-HockeyAppToken: $HOCKEY_APP_TOKEN" \
        https://rink.hockeyapp.net/api/2/apps/upload
        echo "Upload finish HockeyApp "
    fi
else
    echo "Failed to Upload Build on Hockeyapp"
fi



