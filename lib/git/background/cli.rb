# encoding: utf-8

require 'git/background/runner'

module Git
  module Background
    module CLI extend self

      def start
        if ARGV.empty?
          STDERR.puts help
        else
          notifier = parse_argv!
          Process::daemon
          # Git::Background::Runner.new
        end
      end

      def parse_argv!
        require 'optparse'

        notifier = nil
        opt = OptionParser.new
        opt.on('--[no-]notify[=VAL]') do |n|
          notifier = n if n.class == String
        end
        opt.parse!(ARGV)

        notifier
      end

      def help
          'usage: git background [--[no-]notify=[notifier]] commands...'
      end

    end
  end
end

