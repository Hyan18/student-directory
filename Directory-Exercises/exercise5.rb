def input_students
  puts "Please enter the names of the students with some additional information"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # Other info
    puts "Now enter their favourite hobby"
    user_hobby = gets.chomp
    puts "Now enter their country of birth"
    user_cob = gets.chomp
    puts "Now enter their height"
    user_height = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november,
                hobby: user_hobby, country_of_birth: user_cob, height: user_height}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort ), favourite hobby: #{student[:hobby]}, country of birth: #{student[:country_of_birth]}, height: #{student[:height]}"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
