template = <<-TEMPLATE
[submodule "%{submodule}"]
  path = vim/.vim.symlink/bundle/%{submodule}
  url = %{submodule_url}
  ignore = dirty
TEMPLATE

puts Dir.foreach('.').reject { |i| %w(. .. submodule_generation_script.rb).include? i }.map { |dir|
  template % { submodule: dir, submodule_url: `cd #{dir} && git remote -v | grep -o 'git.*git' | head -1`.strip }
}.join
