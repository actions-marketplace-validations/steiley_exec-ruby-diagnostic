# exec-ruby-diagnostic

This Action can run Ruby diagnostic tool(rubocop, haml_lint, brakeman, rails_best_practices, reek, etc.).

This Action runs tools with the version specified in Gemfile.lock.<br>
This Action currently targets only ruby ​​running on rbenv.
# Usage

You need to specify gem_name. Nothing else needed.<br>
Below is a setting example when using [ruby/setup-ruby](https://github.com/ruby/setup-ruby).

```yaml
steps:
- uses: actions/checkout@v2
- uses: ruby/setup-ruby@v1
  bundler-cache: true
- uses: steiley/exec-ruby-diagnostic@v1.0.6
  with:
    gem_name: rubocop
```

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
