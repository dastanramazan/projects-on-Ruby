require 'json' #

def my_data_process(param_1) #Функция которая принимает стринг
    lines = param_1;
    num_lines = lines.length
    hash_gender=Hash.new
    hash_email=Hash.new
    hash_age=Hash.new
    hash_city=Hash.new
    hash_device=Hash.new
    hash_order_at=Hash.new

    index = 1;
    while index < num_lines
        words = lines[index].split(",")
        if(hash_gender.has_key?(words[0])) # .has_key? - method in the hash that takes the key values
            hash_gender[words[0]]+=1
        else
            hash_gender[words[0]] = 1
        end

        if(hash_email.has_key?(words[4])) 
            hash_email[words[4]]+=1
        else
            hash_email[words[4]] = 1
        end
        if(hash_age.has_key?(words[5])) 
            hash_age[words[5]]+=1
        else
            hash_age[words[5]] = 1
        end
        if(hash_city.has_key?(words[6])) 
            hash_city[words[6]]+=1
        else
            hash_city[words[6]] = 1
        end
        if(hash_device.has_key?(words[7])) 
            hash_device[words[7]]+=1
        else
            hash_device[words[7]] = 1
        end
        if(hash_order_at.has_key?(words[9])) 
            hash_order_at[words[9]]+=1
        else
            hash_order_at[words[9]] = 1
        end

        index+=1;

    end

    hash_result =  {"Gender" =>hash_gender, "Email" => hash_email, "Age" => hash_age, "City" => hash_city, "Device" =>hash_device, "Order At" => hash_order_at}
    return hash_result.to_json;

end


# print my_data_process (["Gender,FirstName,LastName,UserName,Email,Age,City,Device,Coffee Quantity,Order At", 
# "Male,Carl,Wilderman,carl,yahoo.com,21->40,Seattle,Safari iPhone,2,afternoon", 
# "Male,Marvin,Lind,marvin,hotmail.com,66->99,Detroit,Chrome Android,2,afternoon", 
# "Female,Shanelle,Marquardt,shanelle,hotmail.com,21->40,Las Vegas,Chrome,1,afternoon", 
# "Female,Lavonne,Romaguera,lavonne,yahoo.com,66->99,Seattle,Chrome,2,morning", 
# "Male,Derick,McLaughlin,derick,hotmail.com,41->65,Chicago,Chrome Android,1,afternoon"])



# Output:
# '{"Gender":{"Male":3,"Female":2},"Email":{"yahoo.com":2,"hotmail.com":3},"Age":{"21->40":2,"66->99":2,"41->65":1},
# "City":{"Seattle":2,"Detroit":1,"Las Vegas":1,"Chicago":1},
# "Device":{"Safari iPhone":1,"Chrome Android":2,"Chrome":2},"Order At":{"afternoon":4,"morning":1}}'