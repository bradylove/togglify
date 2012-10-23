# togglify

A simple Ruby gem that allows you to toggle (enable/disable) blocks of code for Rails.

## Installation

Add it to your Gemfile

    gem 'togglify'

And run bundle install

    $ bundle install

Thats it your ready to start toggling!

## Usage

Anywhere in your code you can add a togglify block giving it a name. Like this one for example

    Togglify(:sample_name) do
      puts "This will be output to the rails log"
    end

By default all toggles are enabled, meaning that any code put in those blocks will be executed. So when this block of code gets ran it will output the puts statement. Now to disable this block of code and any block of cade with the tag :sample_name you can run the following rake command.

    # In ZSH  you will have to escape the square brackets with a \ or prepend the rake command
    # with noglob
    $ rake togglify:disable[sample_name]

Any Togglify block with the name :sample_name is now disabled in the `development` environment. To disable it in other environments append the command with `RAILS_ENV=environment` for example to disable these blocks in the `test` environment you can run

    $ rake togglify:disable[sample_name] RAILS_ENV=test

Then to re-enable all the code blocks with the sample_name tag you can run

    # Again, this defaults to development environment. append RAILS_ENV= for different environments
    $ rake togglify:enable[sample_name]

## Contributing to togglify

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Brady Love. See LICENSE.txt for
further details.
