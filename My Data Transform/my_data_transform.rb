
require 'date'
require 'time'

def time_of_day(hour) # changing the numbers of hours to day parts
    if(hour >= 6 && hour <= 12)
        return "morning";
    elsif(hour >= 12 && hour <= 18)
        return "afternoon"
    elsif(hour >= 18 && hour <= 24)
        return "evening"
    end 

end

def my_data_transform(param_1)
    result = [];     
    
       a = param_1.split("\n")
      
       for index in a
            result.append(index.split(","))
        
       end

    k = 1;
    
    while(k < result.length())  # checking the age of consumers
        if result[k][5].to_i >= 1 && result[k][5].to_i <= 20
            result[k][5]= "1->20"  
        elsif result[k][5].to_i >= 21 && result[k][5].to_i <= 40
            result[k][5]= "21->40"
        elsif result[k][5].to_i >= 41 && result[k][5].to_i <= 65
            result[k][5]= "41->65"
        elsif result[k][5].to_i >= 66 && result[k][5].to_i <= 99
            result[k][5]= "66->99"
        end

        result[k][4] = result[k][4][(result[k][4].index("@") + 1)..-1]
        result[k][9] = time_of_day(DateTime.parse(result[k][9]).hour)
        k+=1
    end   
        
    k = 0;
    while(k < result.length())
        result[k] = result[k].join(',')
        k+=1
    end

    return result;

end



# print my_data_transform("Gender,FirstName,LastName,UserName,Email,Age,City,Device,Coffee Quantity,Order At\nMale,Carl,Wilderman,carl,wilderman_carl@yahoo.com,29,Seattle,Safari iPhone,2,2020-03-06 16:37:56\nMale,Marvin,Lind,marvin,marvin_lind@hotmail.com,77,Detroit,Chrome Android,2,2020-03-02 13:55:51\nFemale,Shanelle,Marquardt,shanelle,marquardt.shanelle@hotmail.com,21,Las Vegas,Chrome,1,2020-03-05 17:53:05\nFemale,Lavonne,Romaguera,lavonne,romaguera.lavonne@yahoo.com,81,Seattle,Chrome,2,2020-03-04 10:33:53\nMale,Derick,McLaughlin,derick,mclaughlin.derick@hotmail.com,47,Chicago,Chrome Android,1,2020-03-05 15:19:48\n")




