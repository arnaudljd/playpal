class GamesController < ApplicationController
  before_action :set_game, only: [:show]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
