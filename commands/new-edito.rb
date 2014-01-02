usage       'new-edito [options]'
aliases     :ne, :edito
summary     'create edito'
description 'This method create a new edito.'

flag   :h, :help,  'show help for this command' do |value, cmd|
  puts cmd.help
  exit 0
end

option   :t, :title,  'title of the edito', :argument => :optional

run do |opts, args, cmd|
  title = opts[:title] || 'my new edito'
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  puts "Creating #{slug}!"

  open("content/editos/#{Time.now.strftime('%Y-%m-%d-%H')}-#{slug}.md", 'w+') do |post|
    post.puts "---"
    post.puts "kind: edito"
    post.puts "date: #{Time.now.strftime('%Y-%m-%d-%H')}"    
    post.puts "title: #{title}"
    post.puts "---"
  end


end