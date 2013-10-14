#!/usr/bin/env ruby
# encoding: utf-8

module Notifier
  module Tmux extend self

    def self.which? cmd
      dir = ENV['PATH'].split(':').find {|p| File.executable? File.join(p, cmd)}
      File.join(dir, cmd) unless dir.nil?
    end

    def supported?
      self.which?('tmux') && ! `tmux ls 2>/dev/null`.empty?
    end

    def notify(options)
      `tmux display-message '[#{options[:title]}] #{options[:message]}'`
    end

  end
end

