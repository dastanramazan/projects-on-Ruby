# Part I
# Create a class User, it will be your interface in order to

# The sqlite filename will be named db.sql. --> for scripts we want to make command and we can write in dbsql
# How to connect ruby to sql  https://zetcode.com/db/sqliteruby/connect/

require 'sqlite3' # You will use the gem sqlite3. Package to install through terminal "gem install sqlite3"

class User
    def makeHash(array) #return in hash
        hash = Hash.new()
        hash['firstname'] = array[0]
        hash['lastname'] = array[1]
        hash['age'] = array[2]
        hash['password'] = array[3]
        hash['email'] = array[4]

        return hash
    end
 
#create user. It will create a user. User info will be: firstname, lastname, age, password and email. And it will return a unique ID (a positive integer)
    def create(user_info) 
        begin
    
            db = SQLite3::Database.open "my_first_app.db"  #open --> it means we are open a database
            db.execute "INSERT INTO users VALUES('#{user_info[0]}', '#{user_info[1]}', '#{user_info[2]}', '#{user_info[3]}', '#{user_info[4]}')"  # we indicating by #index and  we want to add to database the table of users  by dbexecute https://www.devdungeon.com/content/ruby-sqlite-tutorial
        rescue SQLite3::Exception => e   #if there will be mistake
            
            puts "Exception occurred"
            puts e
        ensure  
            # puts "Connected to database" #to check if we connected to database
            id = db.last_insert_row_id #Obtains the unique row ID of the last row to be inserted by this Database instance.
            db.close if db
            puts id
        end
    end

#get user. It will retrieve the associated user and return all information contained in the database.
    def get(user_id) 
        begin
    
            db = SQLite3::Database.open "my_first_app.db"  #Open a database
            user = db.execute "SELECT * FROM users WHERE rowid=#{user_id}" #to retrieve #ROWID is a pseudocolumn that uniquely defines a single row in a database table.       
        rescue SQLite3::Exception => e  
            puts "Exception occurred"
            puts e
            
        ensure
            db.close if db
          
            return makeHash(user[0]) 
        end
    end

# get users. It will retrieve all users and return a hash of users.
    def all 
        begin
    
            db = SQLite3::Database.open "my_first_app.db"  
            users = db.execute "SELECT * FROM users "         
        rescue SQLite3::Exception => e   
            puts "Exception occurred"
            puts e
        ensure
            db.close if db
            hashArray = []
            for user in users
                hash = makeHash(user)
                hashArray.push(hash)
            end
            return hashArray
        end
    end

# update user. It will retrieve the associated user, update the attribute send as parameter with the value and return the user hash.
    def update(user_id, attribute, value)
        begin
            db = SQLite3::Database.open "my_first_app.db"  
            db.execute "UPDATE users SET #{attribute}=#{value} WHERE rowid=#{user_id}"      
        rescue SQLite3::Exception => e  
            puts "Exception occurred"
            puts e
        ensure
            db.close if db
            p "ok"
        end
    end

# destroy user in sqlite. It will retrieve the associated user and destroy it from your database.
        
    def destroy(user_id) 
        begin
            db = SQLite3::Database.open "my_first_app.db" 
            db.execute "DELETE FROM users WHERE rowid=#{user_id}" #delete the records      
        rescue SQLite3::Exception => e   
            puts "Exception occurred"
            puts e
        ensure
            db.close if db
            p "ok"
            
        end 
    end
#method to comparision of 
    def match(email, password)
        begin
    
            db = SQLite3::Database.open "my_first_app.db" 
            id = db.execute "SELECT rowid FROM users WHERE email='#{email}' AND password='#{password}'"      
        rescue SQLite3::Exception => e   
            
            puts "Exception occurred"
            puts e
            
        ensure
            db.close if db
            return id
            
        end 
    end

end # end of the class User

user = User.new()
# user.create(['Dastan', 'Ramazan', 37, 'pass', 'dastanramazan@gmail.com']) # check the creation of db show the id 
#p user.get(1) # to see the output in hash 
#user.create(['Ilyas', 'Shem', 38, 'parol', 'ilyas@gmail.com']) #
# p user.all()
#p user.update(1, 'password', '123')
#user.destroy(2) #Delete the data by the 2nd Id
