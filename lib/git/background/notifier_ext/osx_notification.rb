# encoding: utf-8

require 'terminal-notifier'

module Notifier
  module OsxNotification extend self

    def supported?
      TerminalNotifier::available?
    end

    def notify(options)
      notifier_opts = { title: options[:title], group: Process.pid }
      notifier_opts[:subtitle] = options[:subtitle] if options[:subtitle]
      TerminalNotifier.notify options[:message], notifier_opts
    end

  end
end

