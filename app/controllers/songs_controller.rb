class SongsController < ApplicationController
  def index
    render json: Song.all.as_json
  end

  def show
    song = Song.find_by(id: params[:id])
    render json: song.as_json
  end

  def update
    song = Song.find_by(id: params[:id])
    song.title = params[:title] || song.title
    song.artist = params[:artist] || song.artist
    song.album = params[:album] || song.album
    song.year = params[:year] || song.year
    song.save
    render json: song.as_json
  end

  def destroy
    song = Song.find_by(id: params[:id])
    song.destroy
    render json: {message: "you deleted #{song.title} by #{song.artist}"}
  end

  def create
    song = Song.new(
      title: params[:title],
      artist: params[:artist],
      album: params[:album],
      year: params[:year]
    )
    song.save
    render json: song.as_json
  end


end
