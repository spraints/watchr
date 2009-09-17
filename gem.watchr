# Run me with:
#
#   $ watchr gem.watchr

# --------------------------------------------------
# Convenience Methods
# --------------------------------------------------
def build(gemspec)
  system "gem build %s" % gemspec
  puts
end

# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------
watch( '^watchr.gemspec$' ) { |m| build m[0] }

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\
Signal.trap('QUIT') do
  puts " --- Building Gem ---\n\n"
  build 'watchr.gemspec'
end

# Ctrl-C
Signal.trap('INT') { abort("\n") }


# vim:ft=ruby
