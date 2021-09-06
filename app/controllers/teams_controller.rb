class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]
  before_action :get_pokedex, only: %i[ new edit create update]

  # GET /teams or /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1 or /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
    @team.pokemons.build
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams or /teams.json
  def create
    @team = Team.new(team_params)
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
      end
    end
    @team.trainer = current_trainer
    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
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
