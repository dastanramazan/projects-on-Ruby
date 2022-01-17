# Part II 
# Create/use a User class which will use as a backend sqlite. Filename will be db.sql. Database will be named my_first_app.

require 'sinatra' # connecting to sinatra framework --> gem install sinatra -->http://sinatrarb.com/intro.html
require_relative 'my_user_model.rb' # connecting the file to each other

# To run a server locally you need to use port: 8080 and if you want to access it from your browser, you need to change the binding address to: 0.0.0.0
# It will have a route GET on /. This action will render the template in index.html.
set :bind, '0.0.0.0' 
set :port, '8080'  
enable :sessions  # from https://webapps-for-beginners.rubymonstas.org/sessions/sinatra_sessions.html


# GET on /users. This action will return all users (without their passwords).---> to get the data

get '/users' do   
    user = User.new()
    @users = user.all()  
    erb :index 
end


# POST on /users. Receiving firstname, lastname, age, password and email. It will create a user and store in your database.
post '/users' do
    user = User.new()
    user_info = [params['firstname'], params['lastname'], params['age'], params['password'], params['email']]
    id = user.create(user_info)
    return "succesfully created userId = #{id}"
end


# POST on /sign_in. Receiving email and password. It will add a session containing the user_id in order to be logged in.
post '/sign_in' do
    user = User.new()
    id = user.match(params['email'], params['password'])
    session[:user_id] = id[0][0] 
    "User logged in with id #{id[0][0]}" 
end
 

# PUT on /users. This action require a user to be logged in. It will receive a new password and will update it. It returns the hash of the user.
put '/users' do
    user = User.new()
    id = session[:user_id] 
    if id
        user.update(id, 'password', params['password'])
        "Succesfully Updated USer"
    else
        "Not Authorised"
    end
        
end


# DELETE on /sign_out. This action require a user to be logged in. It will sign_out the current user.
delete '/sign_out' do
    user = User.new()
    id = session[:user_id] 
    if id                      
        session.clear() 
    else
        "Not Authorised"  
    end
end

# DELETE on /users. This action require a user to be logged in. It will sign_out the current user and it will destroy the current user.
delete '/users' do
    user = User.new()
    id = session[:user_id] 
    if id                      
        user.destroy(id)            
        session.delete('user_id')             
    else
        "Not Authorised"
    end

end

