# Snoods extension for Refinery CMS.

## How to build this extension as a gem (not required)

    cd vendor/extensions/snoods
    gem build refinerycms-snoods.gemspec
    gem install refinerycms-snoods.gem

    # Sign up for a https://rubygems.org/ account and publish the gem
    gem push refinerycms-snoods.gem

cp config/application.example.yml REFINERY::config/application.yml
echo /config/application.yml >> .gitignore
gem figaro required


