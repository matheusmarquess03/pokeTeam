require 'rest-client'
require 'json'

class GetPokedex
  attr_reader :pokemon

  def initialize(pokemon='')
    @pokemon = "#{pokemon}/"
    @url = "https://pokeapi.co/api/v2/pokemon/#{@pokemon}?limit=1118"
  end

  def get_pokedex
    resp = RestClient.get(@url)
    resp = JSON.parse(resp.body)['results']
    resp.sort_by { |h| h['name'] }
  end

  def get_pokemon
    resp = RestClient.get(@url)
    resp = JSON.parse(resp.body)
    resp
  end
end