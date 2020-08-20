#Author: Christabel Escarez
#Last updated: August 18, 2020
#Ada Developer's Academy C14
#Ada Build: Section 6 Assessment: question  l, "Account Generator" 

#CONSTANTS
NUM_STUDENTS = 5

#MAIN
puts "Please enter the full names of #{NUM_STUDENTS} students. "

student_names = []
student_ids = []
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

until student_ids.uniq.length == NUM_STUDENTS
  id = rand(111111..999999) 
  while id.to_s[-3..-1].to_i < 100
    id = rand(111111..999999) 
  end
  student_ids << rand(111111..999999) 
end

student_emails = []
student_names.each_with_index do |name, i| 
  split_names = name.split(' ')
  if split_names.length > 2
    first_name_init = ""
    split_names.each do |partial_name|
      first_name_init << partial_name[0] 
    end
    student_emails << first_name_init[0..-2] + split_names[-1] + student_ids[i].to_s[-3..-1] + "@adadevelopersacademy.org"
  else
    student_emails << student_names[i][0] + split_names[-1] + student_ids[i].to_s[-3..-1] + "@adadevelopersacademy.org"
  end
end

#not implemented to print in parallel
student_names.each_with_index do |name, i|
  puts "Name: #{name}"
  puts "ID: #{student_ids[i]}"
  puts "email: #{student_emails[i]}"
end