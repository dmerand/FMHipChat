#!/usr/bin/env ruby

require 'net/http'
require 'json'

#your API authorization token from HipChat goes here
auth_token = "YOUR API TOKEN HERE"
host = "api.hipchat.com"
method = "/v1/rooms/list"

uri = URI("http://#{host}#{method}")
params = { :format => "json", :auth_token => auth_token }
uri.query = URI.encode_www_form(params)

http = Net::HTTP.get_response(uri)
data = http.body if http.is_a?(Net::HTTPSuccess)

#uncomment to read from command line or passed file
#data = ARGF.read

json_data = JSON.parse(data)

#spit out a CSV formatted list of room IDs and names
puts "room_id,room_name"
json_data['rooms'].each do |room|
  puts "#{room['room_id']},\"#{room['name']}\""
end
