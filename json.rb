

require 'json'

puts "What is your email?"

email = gets.chomp

f = File.new("./randomemails.txt","r")

json_data = f.read

f.close

ruby_data = JSON.parse(json_data)

record = ruby_data[email]

if record == nil
  puts "Email cant be found"
else

  puts "What is your Password?"
  password = gets.chomp
  require 'digest/md5'
  hashed_password = Digest::MD5.hexdigest(password)
  if record["password"] == hashed_password
    array_record = record.to_a
    array_record.shift
    question = array_record.sample[0]
    puts "What is your " + question + "?"
    answer = gets.chomp
    if answer == record[question]
      puts "Correct!"
    else
      puts "Wrong Answer"
      exit
    end
  end
end