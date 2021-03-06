# encoding: utf-8

require 'git/background/runner'

module Git
  module Background
    module CLI extend self

      def start
        if ARGV.empty?
          STDERR.puts help
        else
          notifier = parse_notifier!
          Git::Background::Runner.new(notifier).run
        end
      end

      private

      def parse_notifier!
        require 'optparse'

        notifier = false
        opt = OptionParser.new
        opt.on('--[no-]notifier[=VAL]') {|n| notifier = n }
        opt.parse!(ARGV)

        notifier
      end

      def help
          'usage: git background [--[no-]notifier=[notifier]] commands...'
      end

    end
  end
end

