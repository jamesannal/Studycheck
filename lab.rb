require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('controllers/animals_controller')
require_relative('controllers/study_controller')
require_relative('controllers/assignment_controller')

get '/studycheck' do
  erb( :index )
end
