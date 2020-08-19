#Author: Christabel Escarez
#Last updated: August 18, 2020
#Ada Developer's Academy C14
#Ada Build: Section 6 Assessment: question  l, "Account Generator" 

#MAIN
NUM_STUDENTS = 5

student_names = []
student_ids = []
student_emails = []

puts "Please enter the full names of #{NUM_STUDENTS} students. "
i = 0
NUM_STUDENTS.times do 
  print "Student #{i}: "
  student_names << gets.chomp
  until student_names[i].include?(' ')
    puts "Entry was not accepted. Please enter both first and last name."
    student_names[i] = gets.chomp
  end
  i += 1
end
