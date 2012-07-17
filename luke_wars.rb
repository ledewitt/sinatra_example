# gem install sinatra
# gem install sinatra-contrib

# http://www.sinatrarb.com/intro
# * locals ("Accessing Variables in Templates")
# * layout

# Improve API Understanding:
#
# 1. Serve a simple Web page
# 2. Serve a set of related
#    a. Build some data structure (Array of Array or Hash)
#    b. Make it show a page for each thing
#    c. Link me from thing to thing (no keyboard!)
# 3. Build a minimal client script
# 4. Improve server to support an API
# 5. Modify the client to use the API
# 6. Add very simple authentication to API
# ...

# 2000 <-> 3401
#  ^        ^
#  |        |
#  V        V
# 1111 <-> 3219

# User Agent (Browser) ------- HTTP Request ------> *Server*
#                                                      |
# <------------------- HTTP Response ------------------+

# HTTP Request Types (some):
# GET (Type URL, clicked most links)
# POST (submit a form)

# Environments:
# development: build on personal box
# test:        running headless
# production:  running for real on a server

# ERb tags:
# * ANY HTML/CSS/JavaScript
# * <%= ... %> run Ruby, insert result in page
# * <% ... %>  run Ruby code, but don't put in page (mostly for if/each)

require "sinatra"
require "sinatra/reloader" if development?

# SECTORS = { 2000 3401 1111 3219 }

get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params[:name] is 'foo' or 'bar'
  "Hello #{params[:name]}!"
end

get("/sector/:number") {
  erb :sector
  # "Number: #{params[:number]}"
}

get '/say/*/to/*' do
  # matches /say/hello/to/world
  params[:splat] # => ["hello", "world"]
end

set(:probability) { |value| condition { rand <= value } }

get '/win_a_car', :probability => 0.5 do
  "You won!"
end

get '/win_a_car' do
  "Sorry, you lost."
end