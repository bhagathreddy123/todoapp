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

Heroku
=======
add pg gem in Gemfile
then in console 
$ bundle install --without production 
$ heroku login
$ heroku version
heroku-cli/6.99.0-ec9edad (linux-x64) node-v9.11.1
bhagath:~/workspace/todoapp (master) $ heroku keys:add
Found an SSH public key at /home/ubuntu/.ssh/id_rsa.pub
? Would you like to upload it to Heroku? Yes
Uploading /home/ubuntu/.ssh/id_rsa.pub SSH key... done
bhagath:~/workspace/todoapp (master) $ heroku create
Creating app... done, ⬢ quiet-stream-67395
https://quiet-stream-67395.herokuapp.com/ | https://git.heroku.com/quiet-stream-67395.git

$ git push heroku master
$ heroku run rails db:migrate
$ heroku rename bhagath-todo-app

Testing
$ rails generate integration_test pages

$ rails test test/integration/recipes_test.rb 
