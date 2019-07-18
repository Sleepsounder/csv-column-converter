class User < ApplicationRecord
    require 'csv'
#this method works for converting header names to fit the table

    # def self.import(file)
    #     convert = {"Duder" => "user", "Steps" => "steps", "Distance" => "distance", "Exercise" => "exercise", "Sleep" => "sleep", "Calories" => "calories"}
    #     CSV.foreach(file.path, headers: true, header_converters: lambda { |name| convert[name] }) do |row|
    #         User.create! row.to_hash
    #     end
    # end

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            data = row.to_hash
            newdata = data.slice("Duder", "Steps", "Distance", "Exercise", "Sleep", "Calories")
            key_map = { "Duder" => "user", "Steps" => "steps", "Distance" => "distance", "Exercise" => "exercise", "Sleep" => "sleep", "Calories" => "calories" }
            User.create! newdata.transform_keys! { |k| key_map[k]}     
        end
    end
end



#:Duder, :Steps, :Distance, :Exercise, :Sleep, :Calories






#this omits the extra column but does not read the headers as such
    # def self.import(file)
    #     CSV.foreach(file.path, { headers: true, :headers => [:user, :steps, :distance, :exercise, :sleep, :calories]) do |row|
    #         User.create(
    #                     :user => row[:user], 
    #                     :steps => row[:steps], 
    #                     :distance => row[:distance], 
    #                     :exercise => row[:exercise], 
    #                     :sleep => row[:sleep], 
    #                     :calories => row[:calories]
    #                     )
    #     end
    # end

#this omits the extra column but does not read the headers as such

    # def self.import(file)
    #     CSV.foreach(file.path, :headers => true, :headers => [:user, :steps, :distance, :exercise, :sleep, :calories]) do |row|
    #         User.create!(row.to_hash.slice(
    #                     :user, 
    #                     :steps, 
    #                     :distance, 
    #                     :exercise, 
    #                     :sleep, 
    #                     :calories
    #                     ))
    #     end
    # end
    # def self.import(file)
    #     CSV.foreach(file.path, { :col_sep => "\t", :quote_char => '&', :headers => true, #:write_headers => true, 
    #                         :headers => [
    #                                         :user, 
    #                                         :steps, 
    #                                         :distance, 
    #                                         :exercise, 
    #                                         :sleep, 
    #                                         :calories
    #                                     ]}) do |row|
    #         User.create!(:user => row[:user], :steps => row[:steps], :distance => row[:distance], :exercise => row[:exercise], :sleep => row[:sleep], :calories => row[:calories])
    #     end
    # end







# def self.import(file)
    #     CSV.foreach(file.path, :headers => true, :col_sep => ";") do |row|
    #         User.create( :user => row[:user], 
    #                             :steps => row[:steps], 
    #                             :distance => row[:distance], 
    #                             :exercise => row[:exercise], 
    #                             :sleep => row[:sleep], 
    #                             :calories => row[:calories])
    #     end
    # end



    # def self.import(file)
    #     user = []
    #     convert = {"Duder" => "user", "Steps" => "steps", "Distance" => "distance", "Exercise" => "exercise", "Sleep" => "sleep", "Calories" => "calories"}
    #     CSV.foreach(file.path, headers: true, header_converters: lambda { |name| convert[name] }) do |row|
    #         user << [row['user'], row['steps'], row['distance'], row['exercise'], row['sleep'], row['calories']]
    #     end
    #     columns = [:name, :steps, :distance, :exercise, :sleep, :calories]
    #     User.import(columns, user, validate: false)
    # end


#     CSV.foreach(csv_file, {:col_sep => "\t", :quote_char => '&', #:write_headers => true, 
#     :headers => [:geonameid, :name, :ascii_names, :alternate_name, :latitute, :longitude, :feature_class, :feature_code, :country_code, :cc2, :admin_code_1, :admin_code_2, :admin_code_3, :admin_code_4, :population, :elevation, :dem, :timezone, :modification_date]}
#     ) do |row|
#     City.create(:name => row[:name], :timezone => row[:timezone], :country_code => row[:country_code])
#   end


#   City.create(:name => row[:name], :timezone => row[:timezone], :country_code => row[:country_code])
