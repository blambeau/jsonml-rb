begin
  require "rspec/core/rake_task"
  desc "Run RSpec code examples"
  RSpec::Core::RakeTask.new(:spec_test) do |t|
    t.pattern = "spec/**/test_*.rb"
    t.fail_on_error = true
    t.failure_message = nil
    t.verbose = true
    t.ruby_opts = []
    t.rspec_path = "bin/rspec"
    t.rspec_opts = ["--color", "--backtrace"]
  end
rescue LoadError => ex
  task :spec_test do
    abort 'rspec is not available. In order to run spec, you must: gem install rspec'
  end
ensure
  task :spec => [:spec_test]
  task :test => [:spec_test]
end
