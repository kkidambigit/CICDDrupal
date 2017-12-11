#!/bin/bash

# Set build directory.
BUILD_DIR=drupal

# Set branch to build the project. *
#PROFILE_BRANCH=$1

# Set App Path (is empty by default).
#APP_PATH=""

# Set DSN.
DB_NAME="cipoc_drupal7"
DB_USERNAME="root"
DB_PASSWORD="admin"
DB_HOST="127.0.0.1"


# LOG4PHP settings
#ENABLE_LOG4PHP=0

# SOLR settings

# Folder for encrypt secure key
#ENCRYPT_SECURE_KEY_PATH=/tmp

# SMTP settings
#SMTP_SERVER="localhost"
#FROM_EMAIL_ADDRESS="arun.mulukalla@valuelabs.com"
#FROM_EMAIL_DISPLAY_NAME="TEST Support"

# Main host
#MAIN_HOST="localhost"

# The project name 'test' and package suffix 'tgz' is used in Jekins job set up.
#PROJ_NAME=test

# Remove build directory to delete files from previous build.
#rm -rf $BUILD_DIR

SITE_DIR=$BUILD_DIR

# If the previous installation had been cancelled restore the defaults.
if [ -f ./settings.php.orig ]; then
    mv settings.php.org settings.php
fi


# Copy settings.php
cp settings.php settings.php.orig
sed -i -e "s|$\$DB_NAME\\$\\$|$DB_NAME|g" settings.php
sed -i -e "s|$\$DB_USERNAME\\$\\$|$DB_USERNAME|g" settings.php
sed -i -e "s|$\$DB_PASSWORD\\$\\$|$DB_PASSWORD|g" settings.php
sed -i -e "s|$\$DB_HOST\\$\\$|$DB_HOST|g" settings.php



cp settings.php $SITE_DIR/sites/default
mv settings.php.orig settings.php

# Create tmp dir
#sudo mkdir -p $SITE_DIR/sites/default/files/tmp
#chmod rwxrwxrwx $SITE_DIR/sites/default/files/tmp

# Create help dir
#mkdir -p $SITE_DIR/sites/default/files/help
#chmod rwxrwxrwx $SITE_DIR/sites/default/files/help

#cd $SITE_DIR
#drush si standard --account-pass="admin" --site-name="D7" -y
