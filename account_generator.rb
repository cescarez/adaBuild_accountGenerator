#Author: Christabel Escarez
#Last updated: August 18, 2020
#Ada Developer's Academy C14
#Ada Build: Section 6 Assessment: question  l, "Account Generator" 

# If names to be read into from an external file
# 1. change the name of the external file in the below code
# 2. ensure names are separated by a line-break, else fix this code to the appropriate delimiter
# 3. Uncomment the below code block and comment out the NUM_STUDENTS constant

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
  split_names.delete(' ')
  if split_names.length > 2
    name_initials = ""
    split_names.each do |partial_name|
      name_initials << partial_name[0] 
    end
    #name_initials includes initial for last name, so range must be used to exclude final character when building email addresses
    student_emails << name_initials[0..-2] + split_names[-1] + student_ids[i].to_s[-3..-1] + "@adadevelopersacademy.org"
  else
    student_emails << student_names[i][0] + split_names[-1] + student_ids[i].to_s[-3..-1] + "@adadevelopersacademy.org"
  end
end

#output formatting
print "\n"
printf("%-45s", "Name")
printf("%-10s", "ID")
printf("%-45s", "Email")
print "\n"
student_names.each_with_index do |name, i|
  printf("%-45s", name)
  printf("%-10s", student_ids[i])
  printf("%-45s", student_emails[i])
  print "\n"
end