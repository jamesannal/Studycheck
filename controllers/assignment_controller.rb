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
  assignment = Assign.new(params)
  assignment.save
  redirect to("/studycheck/assign")
end

post '/studycheck/assign/:id/delete' do
  assignment.destroy(params[:id])
  redirect to("/assign")
end