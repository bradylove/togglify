# A sample Guardfile
# More info at https://github.com/guard/guard#readme
notification :emacs
ignore %r{^spec/dummy/}, /public/

guard 'rspec', spec_paths: ['spec/lib'] do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
