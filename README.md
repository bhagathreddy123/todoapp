rvm install ruby-2.3.3
rvm --default use 2.3.3
gem install rails -v 5.0.0
rails new todoapp
rails s -b $IP -b $PORT

> t3.valid?
 => false 
2.3.3 :018 > t3.errors.any?
 => true 
2.3.3 :019 > t3.errors.full_messages
 => ["Name can't be blank"] 
 
  todo1=Todo.new(name: "breakfast", description: "puri")                                                                        
 => #<Todo id: nil, name: "breakfast", description: "puri"> 
2.3.3 :008 > todo1.save