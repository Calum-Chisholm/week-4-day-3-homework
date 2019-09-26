require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')
require 'pry'

# index
get '/students' do
  @students = Student.all
  erb(:index)
end

# new
get '/students/new' do
  @houses =House.all
  erb(:new)
end

# show
get '/students/:id' do
  @student = Student.find(params['id'])
  @house = House.find(@student.house_id)
  erb( :show )
end

# create
post '/students' do
  Student.new(params).save
  redirect '/students'
end
# edit
get '/students/:id/edit' do
  @student = Student.find(params[:id])
  @houses = House.all
  erb(:edit)
end
# update
put '/students/:id' do
  Student.new(params).update
  redirect '/students'
end
# destroy
delete '/students/:id' do
  student = Student.find(params[:id])
  student.delete
  redirect '/students'
end
