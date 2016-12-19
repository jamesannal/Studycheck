require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/animal.rb' )
require_relative( '../models/assign.rb' )
require_relative( '../models/study.rb' )


get '/studycheck/assign' do
  @assignments = Assign.all
  @study = Study.all
  erb ( :"assignment/index" )
end

get '/studycheck/assign/new' do
  @animals = Animal.all
  @studies = Study.all
  erb(:"assignment/new")
end

post '/studycheck/assign' do
  @assignment = Assign.new(params)
  @assignment.save
  erb( :"assignment/create")
end

get '/studycheck/assign/:id' do
  id = params[:id]
  @assignment = Assign.find(id)
  erb(:"assignment/show")
end
  
get '/studycheck/assign/:id/edit' do
  @assignment = Assign.find(params[:id])
  erb(:"assignment/edit")
end  

post '/studycheck/assign/:id/delete' do
  Assign.destroy(params[:id])
  redirect to("/studycheck/assign")
end

