class GamesController < ApplicationController

  def create
    @game = policy_scope(Game.find(params[:id]))
  end

  def edit
    @game = Game.find(params[:id])
    @playlists = Playlist.all
  end
end
