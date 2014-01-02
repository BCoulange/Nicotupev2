usage       'new-article [options]'
aliases     :na, :article
summary     'create article'
description 'This method create a new article.'

flag   :h, :help,  'show help for this command' do |value, cmd|
  puts cmd.help
  exit 0
end

option   :t, :title,  'title of the article', :argument => :optional

run do |opts, args, cmd|
  title = opts[:title] || 'my new article'
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  puts "Creating #{slug}!"

  open("content/articles/#{Time.now.strftime('%Y-%m-%d-%H')}-#{slug}.md", 'w+') do |post|
    post.puts "---"
    post.puts "kind: article"
    post.puts "date: #{Time.now.strftime('%Y-%m-%d-%H')}"    
    post.puts "title: #{title}"
    post.puts "---"
  end


end