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

  def update
    @preference = Preference.find(params[:id])
    @preference.update(preference_params)
    redirect_to admin_preferences_path
  end

  private

  def preference_params
   params.require(:preference).permit(:allow_create_songs, :allow_create_artists, :song_sort_order, :artist_sort_order)
  end
end
