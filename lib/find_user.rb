def find_user
    if User.find_by(name: $name_input)
        puts "Welcome back #{$name_input}! You look beautiful today!"
    else
        User.create(name: $name_input)
        puts "Welcome to Eric and Karim's Fantastic Indian Street Food, #{$name_input}!"
    end
end