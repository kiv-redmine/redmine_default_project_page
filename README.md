Redmine default project page
============================

[![Build Status](https://travis-ci.org/kiv-redmine/redmine_default_project_page.svg?branch=testing)](https://travis-ci.org/kiv-redmine/redmine_default_project_page) [![Inline docs](http://inch-ci.org/github/kiv-redmine/redmine_default_project_page.svg?branch=master)](http://inch-ci.org/github/kiv-redmine/redmine_default_project_page)

Plugin for change default project page (not just overview).

Plugin installation and setup
-----------------------------

1. Copy the plugin directory into the plugins directory (make sure the name is redmine_default_project_page)
2. Start Redmine


How to run build on travis?
---------------------------
First of all try to run tests in your environment:

```ruby
ruby plugins/redmine_default_project_page/test/**/*.rb
```

If everyhting is ok, push your changes into master branch and run merge script, which merge master into testing and push to remote (github):

```bash
./push_for_test.sh
```
