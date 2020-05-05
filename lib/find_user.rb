def find_user
    if User.find_by(name: $name_input)
        puts "Welcome back #{$name_input}! You look beautiful today!"
    else
        User.create(name: $name_input)
        puts "Welcome to Taj Mahal Indian Cuisine, #{$name_input}!"
    end
end