class Recipe < ActiveRecord::Base
	include HTTParty

	key_value = ENV['FOOD2FORK_KEY']
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	base_uri "http://#{hostport}/api/search"
	default_params key: "6d65eb04c27225ebe07e186834d9a7cc"
	format :json

	def self.for term
		get("", query: {q: term})["recipes"]
	end
end
