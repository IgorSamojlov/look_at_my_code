namespace :database do
  desc "TODO"
  task add_syntax: :environment do
    Syntax.create(
      [
        {name: 'Ruby', lang: 'ruby'},
        {name: 'C++', lang: 'cpp'},
        {name: 'Go', lang: 'go'},
        {name: 'Python', lang: 'python'},
        {name: 'Java', lang: 'java'},
        {name: 'None', lang: 'none'},
      ]
    )
  end
end
