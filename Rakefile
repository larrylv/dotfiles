require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  non_config_files = %w{Rakefile README.md LICENSE Session.vim}

  Dir['*'].each do |file|
    next if non_config_files.include? file
    next if file == "nvim"

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

  system %Q{mkdir -p $HOME/.config/nvim/lua/after/plugin}
  Dir['nvim/lua/**/*'].each do |file|
    next if File.directory?(file)

    if File.identical? file, File.join(ENV['HOME'], ".config/#{file}")
      puts "identical ~/.config/#{file}"
    else
      puts "linking #{file} to ~/.config/#{file}"
      system %Q{ln -s "$PWD/#{file}" "$HOME/.config/#{file}"}
    end
  end
end

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
