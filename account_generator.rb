#Author: Christabel Escarez
#Last updated: August 18, 2020
#Ada Developer's Academy C14
#Ada Build: Section 6 Assessment: question  l, "Account Generator" 

#CONSTANTS
NUM_STUDENTS = 5

#MAIN
puts "Please enter the full names of #{NUM_STUDENTS} students. "
student_names = []
i = 0
NUM_STUDENTS.times do 
  print "Student #{i + 1}: "
  student_names << gets.chomp.strip.upcase
  until student_names[i].include?(' ')
    puts "Entry was not accepted. Please enter both first and last name."
    student_names[i] = gets.chomp.strip.upcase
  end
  i += 1
end

student_ids = Array.new(NUM_STUDENTS) { rand(111111..999999) }

student_emails = Array.new 
student_names.each_with_index do |name, i|
  split_name = name.split(' ')
  temp_id = student_ids[i]
  student_emails << name[0] + split_name[1] + split_id[-3..-1] + "@adadevelopersacademy.org"
end

student_names.each_with_index do |name, i|
  puts "Name: #{name}"
  puts "ID: #{student_ids[i]}"
  puts "email: #{student_emails[i]}"
end