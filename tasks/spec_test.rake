begin
  require "rspec/core/rake_task"
  desc "Run RSpec code examples"
  RSpec::Core::RakeTask.new(:test) do |t|
    t.pattern = "spec/**/test_*.rb"
    t.rspec_opts = ["--color", "--backtrace"]
  end
rescue LoadError => ex
  task :test do
    abort 'rspec is not available.'
  end
end
