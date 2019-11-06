require 'csv'

@students = [] # an empty array accessible to all methods

def add_student(_name_, _cohort_ = "november") # Add student to the array @students
  @students << {name: _name_, cohort: _cohort_.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students(filename)
  # open the file for writing
  CSV.open(filename, "wb") { |file|
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    file << student_data
  end
  }
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) { |line|
    name, cohort = line
    add_student(name, cohort)
  }
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  filename = "students.csv" if filename.nil? # load students.csv by default if no file is given on startup
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      puts "Inputting the students..."
      input_students
    when "2"
      puts "Showing the students..."
      show_students
    when "3"
      puts "Saving the students..."
      puts "Please enter a filename to save to"
      save_file = gets.chomp
      save_students(save_file)
    when "4"
      puts "Loading the students..."
      puts "Please enter a file to load"
      load_file = gets.chomp
      load_students(load_file)
    when "9"
      puts "Exiting..."
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and run it in the method process
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu