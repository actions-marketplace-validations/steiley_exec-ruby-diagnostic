gem_name = ENV['INPUT_GEM_NAME']

unless gem_name
  p 'You need to specify gem_name.'
  exit 1
end

gemfile_lock_content = File.read('Gemfile.lock')

def install_gem_with_specified_version_by_gemfile_lock(gemfile_lock_content, gem_name)
  matched_data = gemfile_lock_content.match(/#{gem_name} \((?<version>[\d|\.]+)\)/)
  version = matched_data[:version]
  return if version.nil?

  system("gem i #{gem_name}:#{version}")
end

install_gem_with_specified_version_by_gemfile_lock(gemfile_lock_content, gem_name)
if gem_name == 'haml_lint'
  system('gem uninstall -x --force rubocop')
  install_gem_with_specified_version_by_gemfile_lock(gemfile_lock_content, 'rubocop')
end

if %w[rubocop haml_lint].include?(gem_name)
  rubocop_plugin_name_and_versions = gemfile_lock_content.scan(/(rubocop\-.*) \(([\d|\.]+)\)/)
  rubocop_plugin_name_and_versions.each do |rubocop_plugin_name_and_versions|
    system("gem i #{rubocop_plugin_name_and_versions[0]}:#{rubocop_plugin_name_and_versions[1]}")
  end
end

exec_name = { 'haml_lint' => 'haml-lint' }[gem_name] || gem_name
exit(system(exec_name))
