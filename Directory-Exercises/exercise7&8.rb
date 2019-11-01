def input_students
  puts "Please enter the names and cohorts of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Please enter their name"
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # get cohort from the user
    puts "Now enter their cohort"
    user_cohort = gets.chomp
    # add the student hash to the array
    if user_cohort == ""
      students << {name: name, cohort: :november} # Default cohort is November
    else
      students << {name: name, cohort: user_cohort.to_s}
    end
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please enter another name"
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students) # grouped by cohorts
  # List of all existing cohorts
  cohort_list = (students.map { |h| h[:cohort] }).uniq
  cohort_list.each do |month|
      puts "#{month.to_s.capitalize} cohort"
      students.each do |student|
        puts "#{student[:name]} " if student[:cohort] == month
      end
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
