class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]
  before_action :get_pokedex, only: %i[ new edit create update]

  # GET /teams or /teams.json
  def index
    authorize Team, :index?
    @teams = Team.all
  end

  # GET /teams/1 or /teams/1.json
  def show
    authorize @team, :show?
  end

  # GET /teams/new
  def new
    @team = Team.new
    @team.pokemons.build
    authorize @team, :new?
  end

  # GET /teams/1/edit
  def edit
    authorize @team, :edit?
  end

  # POST /teams or /teams.json
  def create
    @team = Team.new(team_params)
    authorize @team, :create?
    params[:team][:pokemons_attributes].each do |index, pokemon|
      unless pokemon['name'].blank?
        pokeapi = GetPokedex.new(pokemon['name']).get_pokemon()
        @pokemon = @team.pokemons.new(name: pokeapi['name'],
                              sprite_url: pokeapi['sprites']['front_default'],
                            )
        types_pokemon = ''
        pokeapi['types'].each do |type|
          types_pokemon += "#{type['type']['name']} "
        end
        @pokemon.type_pokemon = types_pokemon
      end
    end
    @team.trainer = current_trainer

    if @team.save
      redirect_to @team, notice: t(:created, model: t(:team, scope: 'activerecord.models'))
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    authorize @team, :update?
    if @team.update(team_params)
      redirect_to @team, notice: t(:updated, model: t(:team, scope: 'activerecord.models'))
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    authorize @team, :detroy?
    @team.destroy
    redirect_to teams_url, notice: t(:deleted, model: t(:team, scope: 'activerecord.models'))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    def get_pokedex
      @pokedex = GetPokedex.new().get_pokedex()
    end

    # Only allow a list of trusted parameters through.
    def team_params
      # params.require(:team).permit(:name, pokemons_attributes: [:name])
      params.require(:team).permit(:name)
    end
end
