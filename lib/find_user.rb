def find_user
    if User.find_by(name: $name_input)
        puts "Welcome back #{$name_input}"
    else
        User.create(name: $name_input)
        puts "Welcome #{$name_input}"
    end
end