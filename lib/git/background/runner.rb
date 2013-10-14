#!/usr/bin/env ruby
# encoding: utf-8

require 'notifier'
require 'git/background/notifier_ext'

module Git
  module Background
    class Runner

      def initialize notifier_name
        if notifier_name
          notifier = Notifier::supported_notifier_from_name notifier_name
          raise "#{notifier} is not supported" unless notifier
          Notifier::default_notifier = notifier
        end
      end

      def run
        Process::daemon true
        result = `git #{ARGV.join ' '}`
        Notifier::notify(
          title: "git-background: #{$?.success? ? 'success' : 'failed'}",
          message: result
        )
      end
    end
  end
end

