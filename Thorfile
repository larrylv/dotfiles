require 'thor'
require 'erb'

class Dotfiles < Thor
  default_task :install

  desc 'install', "install the dot files into user's home directory"
  method_option :force, :type => :boolean, :aliases => "-f"
  def install
    replace_all = options[:force]
    Dir['*'].each do |file|
      next if %w[Rakefile Thorfile README.md LICENSE Session.vim].include? file

      if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
        if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
          puts "identical ~/.#{file.sub('.erb', '')}"
        elsif replace_all
          replace_file(file)
        else
          print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq]"
          case $stdin.gets.chomp
          when 'a'
            replace_all = true
            replace_file(file)
          when 'y'
            replace_file(file)
          when 'q'
            exit
          else
            puts "skipping ~/.#{file.sub('.erb', '')}"
          end
        end
      else
        link_file(file)
      end
    end
  end

  private

  def replace_file(file)
    system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
    link_file(file)
  end

  def link_file(file)
    if file =~ /.erb$/
      puts "generating ~/.#{file.sub('.erb', '')}"
      File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
        new_file.write ERB.new(File.read(file)).result(binding)
      end
    else
      puts "linking ~/.#{file}"
      system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
    end
  end
end
