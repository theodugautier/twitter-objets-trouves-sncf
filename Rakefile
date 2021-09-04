# frozen_string_literal: true

require 'pry'
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]

task :console do
  Pry.start
end

task :run do
  ruby 'lib/cool_program.rb'
end
