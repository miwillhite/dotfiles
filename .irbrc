require 'rubygems'
%x{gem install 'interactive_editor' --no-ri --no-rdoc} unless Gem.available?('interactive_editor')
Gem.refresh
require 'interactive_editor'

def m(o)
  o.methods.sort - Object.methods
end

def pbcopy(str)
  IO.popen('pbcopy', 'w') { |f| f << str }
end

begin
  require "ap"
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
rescue LoadError => e
  puts "ap gem not found.  Try typing 'gem install awesome_print' to get super-fancy output."
end

