require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal.rb')

get '/studycheck/animals' do
  @animals = Animal.all()
  erb ( :"animals/index" )
end

get '/studycheck/animals/new' do
  @animals = Animal.all()
  erb ( :"animals/new")
end

post '/studycheck/animals' do
  @animal = Animal.new(params)
  @animal.save()
  erb(:"animals/create")
end

get '/studycheck/animals/:id/edit' do
 @animal = Animal.find_by_id(params[:id])
 erb( :"animals/edit" )
end

post '/studycheck/animals/:id' do
  Animal.update(params)
  redirect to("/studycheck/animals/#{ params[:id]}")
end