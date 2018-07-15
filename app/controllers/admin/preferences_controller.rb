class Admin::PreferencesController < ApplicationController
  def index
    if Preference.all.empty?
      @preference = Preference.new
    else
      @preference = Preference.first
    end
  end

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.create(song_sort_order: params[:song_sort_order], artist_sort_order: params[:artist_sort_order], allow_create_artists: params[:allow_create_artists], allow_create_songs: params[:allow_create_songs])
  end

  def edit
  end

  def update
  end
end
