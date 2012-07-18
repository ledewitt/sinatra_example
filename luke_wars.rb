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

SECTORS = { 1111 => [2000, 3219],
            2000 => [1111, 2401],
            3401 => [2000, 3219],
            3219 => [1111, 3219] }

# get('/sector/:number/:sector_number') {
#   erb :number
#   # "Number: #{params[:number]}"
# }

# get("/sector/:sector_number") {
#   erb :sector
#   # "Number: #{params[:number]}"
# }


get('/sector/:number') {
  if SECTORS.include? params[:number].to_i
    # "sector_#{params[:number]}"
    erb "sector_#{params[:number]}".to_sym
  else
    "Back off man I'm a scientist.  IE not a valid sector of space!"
  end
}