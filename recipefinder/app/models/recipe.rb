class Recipe < ActiveRecord::Base
  include HTTParty

  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  user_key = ENV['FOOD2FORK_KEY']

  base_uri "http://#{hostport}/api"
  default_params key: user_key
  format :json

  def self.for(term)
    get('/search', query: { q: term })['recipes']
  end
end
