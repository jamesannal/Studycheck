require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/study.rb')

get '/studycheck/studies' do
  @studies = Study.all()
  erb ( :"studies/index" )
end

get '/studycheck/studies/new' do
  # @studies = Study.all()
  erb ( :"studies/new" )
end

post '/studycheck/studies' do
  @studies = Study.new(params)
  @studies.save()
  erb( :"studies/create" )
end

get '/studycheck/studies/:id' do
  id = params[:id]
  @study = Study.find(id)
  erb(:"studies/show")
end

get '/studycheck/studies/:id/edit' do
  @study = Study.find(params[:id])
  erb(:"studies/edit")
end

post '/studycheck/studies/:id' do
  Study.update(params)
  redirect to "/studycheck/studies/#{ params[:id]}"
end

post '/studycheck/studies/:id/delete' do
  Study.destroy( params[:id] )
  redirect to('/studycheck/studies')
end