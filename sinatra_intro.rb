require "sinatra"
require "sinatra/reloader" if development?

get '/:id' do
  @foo = Foo.find(params[:id])
  haml '%h1= @foo.name'
end

# get '/:id' do
#   foo = Foo.find(params[:id])
#   haml '%h1= bar.name', :locals => { :bar => foo }
# end

# get '/hello/:name' do
#   # matches "GET /hello/foo" and "GET /hello/bar"
#   # params[:name] is 'foo' or 'bar'
#   "Hello #{params[:name]}!"
# end
# 
# get '/say/*/to/*' do
#   # matches /say/hello/to/world
#   params[:splat] # => ["hello", "world"]
# end
# 
# set(:probability) { |value| condition { rand <= value } }
# 
# get '/win_a_car', :probability => 0.5 do
#   "You won!"
# end
# 
# get '/win_a_car' do
#   "Sorry, you lost."
# end
# 
# get '/time' do
#   code = "<%= Time.now %>"
#   erb code
# end
# 
# get '/foo' do
#   status 418
#   headers \
#     "Allow"   => "BREW, POST, GET, PROPFIND, WHEN",
#     "Refresh" => "Refresh: 20; http://www.ietf.org/rfc/rfc2324.txt"
#   body "I'm a tea pot!"
# end