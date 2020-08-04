# exec-ruby-diagnostic

This Action can run Ruby diagnostic tool(rubocop, haml_lint, brakeman, rails_best_practices, reek, etc.).

This Action runs tools with the version specified in Gemfile.lock.  
This Action currently targets only ruby ​​running on rbenv.
# Usage

You need to specify gem_name. Nothing else needed.  
Below is a setting example when using [masa-iwasaki/setup-rbenv](https://github.com/marketplace/actions/setup-rbenv).

```yaml
steps:
- uses: actions/checkout@master
- uses: masa-iwasaki/setup-rbenv@v1
- name: Install Ruby
  run: |
    eval "$(rbenv init -)"
    rbenv install -s `cat .ruby-version` # or specify the version you want

- uses: steiley/exec-ruby-diagnostic@v1.0.1
  with:
    gem_name: rubocop
```

## With cache

Below is a setting example when using [actions/cache](https://github.com/actions/cache).

```yaml
steps:
- uses: actions/checkout@master
- uses: masa-iwasaki/setup-rbenv@v1

- name: Cache RBENV_ROOT
  uses: actions/cache@v1
  id: cache_rbenv
  with:
    path: /home/runner/.rbenv
    key: ${{ runner.os }}-rbenv-${{ hashFiles('**/.ruby-version') }}
    restore-keys: |
      {{ runner.os }}-rbenv-

- name: Install Ruby
  run: |
    eval "$(rbenv init -)"
    rbenv install -s `cat .ruby-version`

- uses: steiley/exec-ruby-diagnostic@v1.0.1
  with:
    gem_name: rubocop
```

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
