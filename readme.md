# Snoods extension for Refinery CMS.

Simple RefineryCMS extension for creating download pages and sending leads to Salesforce.

## How does Snoods work?

Snoods provides a basic form for embedding on lead generation/download pages. The prospect surrenders an email address for access to a download like a white paper or video. Prospect information is saved in a table called Snoods and is sent to Salesforce using Salesforce's web-to-lead process (Salesforce account required). The link is sent from Salesforce, where you can also automate various processes to manage the lead over its lifetime. 

## Requirements

This version of `refinerycms-jobs` supports Refinery 3.x and Rails 4.1.x.

* [Refinery CMS](http://refinerycms.com) version 3.0.0 or above.
* Figaro gem recommended for configuration

## Install

Open up your ``Gemfile`` and add at the bottom this line:

```ruby
gem 'snoods', github: 'cleverlemming/refinerycms-snoods', branch: 'master'
```

Now, run ``bundle install``

Next, to install the snoods plugin run (check):

    rails generate refinery:snoods

Run database migrations:

    rake db:migrate

### Configuration

Copy application.example.yml to refinery's root config directory and be sure application.yml is in .gitignore (Figaro gem required). Figaro will add application.yml to .gitignore when you run ``figaro install.``




