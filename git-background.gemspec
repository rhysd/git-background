# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git/background/version'

Gem::Specification.new do |spec|
  spec.name          = "git-background"
  spec.version       = Git::Background::VERSION
  spec.authors       = ["rhysd"]
  spec.email         = ["lin90162@yahoo.co.jp"]
  spec.description   = %q{execute git command in background}
  spec.summary       = %q{This gem provides `git background` command.
                          git-background executes following command with background
                          and notify them using notification system.}
  spec.homepage      = "https://github.com/rhysd/git-background"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
