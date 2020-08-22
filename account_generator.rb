#Author: Christabel Escarez
#Last updated: August 18, 2020
#Ada Developer's Academy C14
#Ada Build: Section 6 Assessment: question  l, "Account Generator" 
#sources:
# https://www.rubyguides.com/2018/01/ruby-string-methods/
# https://www.rubyguides.com/2015/05/working-with-files-ruby/
# https://ruby-doc.org/core-2.7.1/Kernel.html#method-i-sprintf

 
# If names to be read into from an external file
# 1. change the name of the external file in the below code (currently coded as: "names.txt")
# 2. ensure names are separated by a line-break in the external file
# 3. Uncomment the below code block and comment out the following code block (end marked with "END BLOCK")

##################### UNCOMMENT THIS CODE TO ADD STUDENT NAMES FROM AN EXTERNAL FILE #############
external_file_data = File.readlines("names.txt")
NUM_STUDENTS = external_file_data.length

student_names = []
external_file_data.each do |name|
  if name.strip.length > 0
    student_names << name.strip.upcase
  end
end

###################################### END BLOCK #########################################
##################### UNCOMMENT THIS CODE TO MANUALLY ADD STUDENT ACCOUNTS #############
# #CONSTANTS
# NUM_STUDENTS = 5

# #MAIN
# puts "Please enter the full names of #{NUM_STUDENTS} students. "

# student_names = []
# i = 0
# NUM_STUDENTS.times do 
#   print "Student #{i + 1}: "
#   student_names << gets.chomp.strip.upcase
#   until (student_names[i].include?(' ') && student_names[i].strip.length > 0)
#     puts "Entry was not accepted. Please enter student first and last name."
#     student_names[i] = gets.chomp.strip.upcase
#   end
#   i += 1
# end
###################################### END BLOCK #########################################

student_names.compact
student_ids = []
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
    student_emails << name[0] + split_names[-1] + student_ids[i].to_s[-3..-1] + "@adadevelopersacademy.org"
  end
end

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