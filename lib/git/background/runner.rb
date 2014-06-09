#!/usr/bin/env ruby
# encoding: utf-8

require 'notifier'
require 'git/background/notifier_ext'

module Git
  module Background
    class Runner

      def initialize notifier_name
        case notifier_name
        when String
          notifier = Notifier::supported_notifier_from_name notifier_name
          raise "#{notifier_name} is not supported" unless notifier
          Notifier::default_notifier = notifier
        when false
          @no_notifier = true
        end
      end

      def run
        Process::daemon true
        result = `git #{ARGV.join ' '}`
        Notifier::notify(
          title: "git-background: #{$?.success? ? 'success' : 'failed'}",
          message: result,
          image: '' # why cannot be nilable???
        ) unless @no_notifier
      end
    end
  end
end
