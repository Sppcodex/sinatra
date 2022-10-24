require 'bundler'
Bundler.require
require 'csv'
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do                                      #Lien pour la page index
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do                          #Lien pour la page new_gossip
    erb :new_gossip
  end

  post '/gossips/new/' do                          #Lien pour la page new_gossip => version POST
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do                            #Gestion des URLs dynamiques
		erb :show, locals: {gossip: Gossip.all[params[:id].to_i], id: params[:id].to_i}
	end

end