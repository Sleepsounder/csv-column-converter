class User < ApplicationRecord
    require 'csv'

    def self.import(file)
        convert = {"Duder" => "user", "Steps" => "steps", "Distance" => "distance", "Exercise" => "exercise", "Sleep" => "sleep", "Calories" => "calories"}
        CSV.foreach(file.path, headers: true, header_converters: lambda { |name| convert[name] }) do |row|
            User.create! row.to_hash
        end
    end
end


