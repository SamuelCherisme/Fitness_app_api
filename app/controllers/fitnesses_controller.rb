class FitnessesController < ApplicationController
  before_action :set_fitness, only: [:show, :update, :destroy]

  # GET /fitnesses
  def index
    @fitnesses = Fitness.all

    render json: @fitnesses
  end

  # GET /fitnesses/1
  def show
    render json: @fitness
  end

  # POST /fitnesses
  def create
    @fitness = Fitness.new(fitness_params)

    if @fitness.save
      render json: @fitness, status: :created, location: @fitness
    else
      render json: @fitness.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fitnesses/1
  def update
    if @fitness.update(fitness_params)
      render json: @fitness
    else
      render json: @fitness.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fitnesses/1
  def destroy
    @fitness.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fitness
      @fitness = Fitness.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fitness_params
      params.require(:fitness).permit(:name, :description)
    end
end
