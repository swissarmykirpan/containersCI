require "bundler/setup"
require "rake"
require "rspec/core/rake_task"

namespace :spec do
  targets = []
  Dir.glob("./spec/*").each do |dir|
    next unless File.directory?(dir)
    targets << File.basename(dir)
  end

  task :all => targets
  task :default => :all

  desc "Run serverspec tests"

  targets.each do |target|
    desc "Run serverspec tests to #{target}"
    RSpec::Core::RakeTask.new(target.to_sym) do |t|
      ENV['DOCKER_IMAGE'] = "gusohal/#{target}:latest"
      t.pattern = "spec/#{target}/*_spec.rb"
    end
  end
end
