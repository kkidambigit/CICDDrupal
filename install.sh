#!/bin/bash

# The project name 'test' and package suffix 'tgz' is used in Jenkins job set up.
PROJ_NAME=test
PACKAGE=$PROJ_NAME.zip

# Directory where the package is built. 
BUILD_DIR=$PWD/src
WORKING_DIR=$PWD

# Copy jwplayer from external lib to tmp folder
echo "WORKING_DIR=$WORKING_DIR"
cd /tmp/
cd $WORKING_DIR
ls

# Remove build directory to delete files from previous build.
#rm -rf $BUILD_DIR

SITE_DIR=$BUILD_DIR
SITE_ADMIN_DIR=$SITE_DIR/siteadmin
MONITORS_DIR=$SITE_DIR/monitors

# Copy settings.php
cp settings.php $SITE_DIR/sites/default
cp settings.php $SITE_DIR/sites/default/settings.php.orig


# Rewrite htaccess file
#cp $BUILD_DIR/$PROJ_NAME/profiles/test/.htaccess $BUILD_DIR/$PROJ_NAME/

# Generate version file
{
	echo "Jenkins Environment Variables"
	echo "-----------------------------"
	echo "BUILD_NUMBER         = $BUILD_NUMBER"
	echo "BUILD_ID             = $BUILD_ID"
	echo "BUILD_URL            = $BUILD_URL"
	echo "JOB_NAME             = $JOB_NAME"
	echo "NODE_NAME            = $NODE_NAME"
	echo "GIT_COMMIT           = $GIT_COMMIT"
	echo "GIT_BRANCH           = $GIT_BRANCH"
	echo "WORKSPACE            = $WORKSPACE"
	echo "TEST_BRANCH"         = $TEST_BRANCH
	echo "PROFILE_BRANCH" = $PROFILE_BRANCH

	echo ""
	
	# Get repository info
	
	OLD_DIR=$PWD
	
	for i in $PWD/ $SITE_DIR/profiles/test; do
		cd $i
		
		echo "*********************************************************************"	
		echo "Generating git info for $PWD"
		
		echo "git symbolic-ref  HEAD"
		git symbolic-ref  HEAD

		echo ""

		echo "git log -n 1"
		git log -n 1

		echo ""
		echo ""
	done	
	
	cd $OLD_DIR

} > $SITE_ADMIN_DIR/version.txt

