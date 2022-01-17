require 'csv'

class MySelectQuery
    @csv_string = []  # @ - field - привязка иммено к классу, чтобы потом использовать
    def initialize(csv) # все конструкторы начинаюся с initialize
        @csv_string = csv #CSV comma separated values
    end

    def where(column_name, criteria)
        new_array = Array.new
        lines = @csv_string.split("\n")
        headers = lines[0].split(',')

        column_name_index = headers.index(column_name)
        for line in lines do # do необязательно использовать
            a = line.parse_csv[column_name_index]

            if (a == criteria)
                new_array.push(line)
            end
        end
        return new_array
    end
end

#создать класс и исполнить один метод where с двумя параметрами. Возвращает critearia с именем column_name