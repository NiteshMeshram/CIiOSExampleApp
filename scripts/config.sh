#!/bin/sh
export APP_FULLNAME=CIiOSExampleApp

#DEVELOPER_NAME : must have the name appeared on the certificate used. Generally this should not be changed.
export DEVELOPER_NAME="iPhone Distribution: V2Solutions, Inc."

#APP_PROFILE_PATH : GITHUB repository relative path for the provisioning profile.
#                   Standard file already available in respective folder.
#                   DO not change until scripts or profile folder name changed.
export APP_PROFILE_PATH="$PWD/scripts/profile/"
#APP_SCRIPT_PATH : Shell script path which is referred internally. Do not change until scripts folder name changed.
export APP_SCRIPT_PATH="$PWD/scripts/certs/"


#APP_NAME : Name of the .app and .ipa file
export APP_NAME="CIiOSExampleApp"
#APP_WORKSPACE_PATH : Relative path of the .xcworkspace file
export APP_WORKSPACE_PATH="CIiOSExampleApp.xcworkspace"
#APP_SCHEME : Name of the xCode scheme. It is assume that all the scheme has the same name.
#             It is automatically suffixed by scheme (DEV/QA/UAT)
export APP_SCHEME="CIiOSExampleApp"
#Settings For Getting Pivotal Notes : Settings For Getting Pivotal Notes
export INFOPLIST_FILE="CIiOSExampleApp/info.plist"
export PIVOTAL_PROJECT_ID=1114232

export PIVOTAL_TOKEN='763aa9881c2d64966f6c17be60926221'
export OUTPUT_FILE_NAME='jsonresponse.text'


export DEV_HOCKEY_APP_ID="a4536543bb0c47aaa0e248f90dc7e37c"
export DEV_HOCKEY_APP_TOKEN="a3ad66f4b2da462e92f9585e82ee5b20"
#export QA_HOCKEY_APP_ID="6d54550725df43c4936b5cb4e4b5cabe"
#export QA_HOCKEY_APP_TOKEN="931716b50b1f4c17944ae45564c6e0cb"
#export UAT_HOCKEY_APP_ID="1a2cd51d86f445c79b37e933bc7b3532"
#export UAT_HOCKEY_APP_TOKEN="931716b50b1f4c17944ae45564c6e0cb"




#APP_APPLE_CERTIFICATE : Apple standard certificate. Do not changed until required.
export APP_APPLE_CERTIFICATE="apple.cer"

#*****************************Swift Certificates**********************

#APP_TEAM_AGENT_DISTRIBUTION_CERTIFICATE : Certificated generated from Apple portal.
#                                          Do not change until certificate is expired / regenerated
export APP_TEAM_AGENT_DISTRIBUTION_CERTIFICATE="Certificates_Swift.cer"
#APP_TEAM_DISTRIBUTION_PRIVATE_KEYS :  Private key generated using key chain. Do not change until regenerated.
export APP_TEAM_DISTRIBUTION_PRIVATE_KEYS="Key_Swift.p12"

#3. PROFILE_NAME : Certificate profile name. Generally this should not be changed
export PROFILE_NAME="Distribution_Swift"

#*****************************Swift Certificates**********************



