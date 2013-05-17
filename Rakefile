# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "quality_time"
  gem.homepage = "http://github.com/teleological/quality_time"
  gem.license = "MIT"
  gem.summary = %Q{Patches Ruby's Time and Date classes to do the right thing}
  gem.description = <<-TXT
QualityTime extends Ruby's standard Time and Date classes to facilitate safer and more deliberate manipulation of chronological and calendar values, especially for values that precede the introduction of the Gregorian calendar.
  TXT
  gem.email = "oss+time@teleological.net"
  gem.authors = ["Riley Lynch"]
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "quality_time #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
