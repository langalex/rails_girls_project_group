# these are a few example snippets of ruby code to do fun/useful things

require 'rainbow' # this is for the colors. need to run 'gem install rainbow'

def puts_line(character = '-')
  line = character * 80 # gets me 80 dashes
  puts line.color(:green) # prints it out in green
end

puts_line

def puts_headline(string)
  puts string.color(:yellow)
end

# #########################################################################

# parsing CSV
def csv
  require 'open-uri'
  require 'csv'
  puts_headline 'CSV data:'

  # parse data and print each line
  csv_data = open('https://gist.github.com/raw/787c632283ab32431b99/35ce73dca3a74009122a82265ed88dd76595ff2a/test.csv').read
  CSV.parse(csv_data, col_sep: ';', headers: true) do |row|
    p row.to_hash
  end

  puts_line
  puts 'Computers from people from Poland:'

  # extract the computers of the people from poland...
  computers = []
  CSV.parse(csv_data, col_sep: ';', headers: true) do |row|
    if row.to_hash['Country'] == 'Poland'
      computers << row.to_hash['Computer']
    end
  end

  p computers

  # .. and write to csv file again

  csv = CSV.generate do |csv|
    computers.each do |computer|
      csv << [computer]
    end
  end

  puts_line
  puts 'As CSV again:'
  puts csv
end
csv

# #########################################################################

# determine size of all fiels in a directory
def directories
  puts_line '='
  dir = File.absolute_path File.dirname(__FILE__)
  puts_headline "Counting directory sizes"
  print "Directory size of #{dir}: "
  output = `cd #{dir} && du -sh`
  size = output.scan(/\d+\.?\d*\w/).first
  puts size
end
directories

# #########################################################################

def email
  puts_line '='
  puts_headline 'Sending Email:'
  puts "This is what you would do:"
  puts "\trequire 'pony'\n\tPony.mail(:to => 'you@example.com', :from => 'me@example.com', :subject => 'hi', :body => 'Hello there.')".color('#AAAAAA')
end
email

# #########################################################################

def backup
  puts_line '='
  puts_headline 'Backup:'
  puts "Look at a gem called safe (https://github.com/astrails/safe)"
end
backup

# #########################################################################

def twitter
  puts_line '='
  puts_headline 'Twitter'

  require 'twitter'
  require_relative './twitter_config' # loads a file with my secret twitter credentials (not part of the repo)

  puts_headline 'Getting user details'
  user = Twitter.user('langalex')
  puts "Name: " + user[:name]
  puts "Bio: #{user[:description]}"

  puts_line
  puts_headline 'Getting latest tweets'
  tweets = Twitter.user_timeline("langalex")

  puts tweets.map{ |tweet| tweet.text }

  puts_line
  puts_headline "Search (#railsgirls):"
  puts Twitter.search("#railsgirls", {:count => 10}).results.map{|tweet| tweet.text }
end
twitter
