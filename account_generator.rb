#Author: Christabel Escarez
#Last updated: August 18, 2020
#Ada Developer's Academy C14
#Ada Build: Section 6 Assessment: question  l, "Account Generator" 

#CONSTANTS
NUM_STUDENTS = 5

student_info = Hash.new()
#MAIN
puts "Please enter the full names of #{NUM_STUDENTS} students. "
i = 0
student_info[:names] = Array.new 
NUM_STUDENTS.times do 
  print "Student #{i + 1}: "
  student_info[:names] << gets.chomp.strip.upcase
  until student_info[:names][i].include?(' ')
    puts "Entry was not accepted. Please enter both first and last name."
    student_info[:names][i] = gets.chomp.strip.upcase
  end
  i += 1
end

student_info[:ids] = Array.new(NUM_STUDENTS) { rand(111111..999999) }

student_info[:emails] = Array.new 
student_names.each_with_index { |name, i| student_emails << student_names[i][0] + student_names[i].split(' ')[-1] + student_ids[i].to_s[-3..-1] + "@adadevelopersacademy.org" }
# student_info[:names].each_with_index do |name, i|
#   split_name = student_info[:names][i].split(' ')
#   split_id = student_info[:ids][i].to_s.split('')
#   student_info[:emails] << student_info[:names][i][0] + split_name[-1] + split_id[-3] + split_id[-2] + split_id[-1] + "@adadevelopersacademy.org"
# end

student_info[:names].each_with_index do |name, i|
  puts "Name: #{name}"
  puts "ID: #{student_info[:ids][i]}"
  puts "email: #{student_info[:emails][i]}"
end