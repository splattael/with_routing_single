# Reproduction for `with_routing` test failure

The last test should not fail with `ActionController::UrlGenerationError`:

```
$ ruby single.rb
Fetching gem metadata from https://rubygems.org/..............
Fetching version metadata from https://rubygems.org/.
Resolving dependencies...
Using rake 12.0.0
Using i18n 0.8.0
Using json 1.8.6
Using minitest 5.10.1
Using thread_safe 0.3.5
Using builder 3.2.3
Using erubis 2.7.0
Using mini_portile2 2.1.0
Using rack 1.6.5
Using thor 0.19.4
Using bundler 1.13.7
Using tzinfo 1.2.2
Using nokogiri 1.7.0.1
Using rack-test 0.6.3
Using activesupport 4.2.7.1
Using loofah 2.0.3
Using rails-deprecated_sanitizer 1.0.3
Using rails-html-sanitizer 1.0.3
Using rails-dom-testing 1.0.8
Using actionview 4.2.7.1
Using actionpack 4.2.7.1
Using railties 4.2.7.1
Run options: --seed 9357

# Running:

E...

Finished in 0.029494s, 135.6226 runs/s, 101.7169 assertions/s.

  1) Error:
WithDefaultsControllerTest#test_works_using_`with_routing`:
ActionController::UrlGenerationError: No route matches {:action=>"index", :controller=>"simple", :defaults=>true}
    

4 runs, 3 assertions, 0 failures, 1 errors, 0 skips
```
