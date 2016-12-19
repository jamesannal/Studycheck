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