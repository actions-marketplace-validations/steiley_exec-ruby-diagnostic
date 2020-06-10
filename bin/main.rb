gem_name = ENV['INPUT_GEM_NAME']
unless gem_name
  p 'You need to specify gem_name.'
  exit 1
end
gemfile_lock_content = File.read('Gemfile.lock')
matched_data = gemfile_lock_content.match(%r[#{gem_name} \((?<version>[\d|\.]+)\)])
version = matched_data[:version]
system("gem i #{gem_name}:#{version}")
exec_name = {'haml_lint' => 'haml-lint'}[gem_name] || gem_name
system(exec_name)
