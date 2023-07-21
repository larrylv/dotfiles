require 'rake'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  non_config_files = %w{Rakefile README.md LICENSE Session.vim}

  Dir['*'].each do |file|
    next if non_config_files.include? file
    next if file == "nvim"

    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file}")
        puts "identical ~/.#{file}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq]"
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end

  Dir['nvim/*'].each do |file|
    if File.identical? file, File.join(ENV['HOME'], ".config/#{file}")
      puts "identical ~/.config/#{file}"
    else
      puts "linking #{file} to ~/.config/#{file}"
      system %Q{ln -s "$PWD/#{file}" "$HOME/.config/#{file}"}
    end
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
