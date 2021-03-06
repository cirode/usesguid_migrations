require 'jeweler'
require 'rake/rdoctask'
require 'spec'
require 'spec/rake/spectask'

Jeweler::Tasks.new do |gem|
  gem.name = "usesguid_migrations"
  gem.summary = %Q{Makes your migrations work with usesguid plugin without explicitly defining the keys migrations.}
  gem.description = %Q{Makes your migrations work with usesguid plugin without explicitly defining the primary key id or foreign keys in migrations.}
  gem.email = "jason@lookforwardenterprises.com"
  gem.homepage = "http://github.com/midas/usesguid_migrations"
  gem.authors = ["Jason Harrelson"]
  gem.add_development_dependency "rspec"
  gem.add_dependency "activerecord", ">= 2.3"
  gem.add_dependency "usesguid"
end
Jeweler::GemcutterTasks.new

Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "usesguid_migrations #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
