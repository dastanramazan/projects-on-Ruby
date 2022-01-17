def my_csv_parser(param_1, param_2)
       
       result = [];     
    
       a = param_1.split("\n")
      
       for index in a
            result.append(index.split(param_2))
        
       end

    return result



end

#  print my_csv_parser("a,b,c,e\n1,2,3,4\n",  ",")

