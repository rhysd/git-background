# Git::Background

Execute git commands in background and notify the result.  Executing in background is convenient in commands which take a while, like `git pull`, `git push` and so on.  `git background` command is provided for the purpose.

## Installation

Add this line to your application's Gemfile:

    gem 'git-background'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install git-background

## Usage

Use `git background` command.

For example, `git push` in background:

    git background push

You can specify the notification with option `--notifier=`.
For example, to notify with tmux:

    git background --notifier=tmux push

Available notifiers are listed in [notifier gem](https://github.com/fnando/notifier) or `tmux` or `osx_notification`.

If you don't want to notify, use option `--no-notifier`.

    git background --no-notifier push

Alias like `bg` is very useful.

    git config --global alias.bg background

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

This gem is distributed under MIT license.
