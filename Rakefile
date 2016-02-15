require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |t|
  cd "test"
  t.pattern = "*_spec.rb"
  t.rspec_opts = %w(--format documentation --color)
end

task default: %w[spec]