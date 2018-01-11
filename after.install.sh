#!/bin/bash

# Copy csv files.
cd drupal/sites/all/

#Enable modules or set drush commands
drush en custom_changes -y
drush en demo_11jan -y
drush en demo_list_view -y
drush en show_node_titles -y

# Set the path for ://public stream.
#drush vset --yes file_public_path "sites/default/files"

# Set the default folder for source files of migration.
#drush vset --yes dblog_row_limit 1000000

# Create db backup before migration.
#drush sql-dump --result-file=/home/vagrant/db_backups/before_migration.sql
