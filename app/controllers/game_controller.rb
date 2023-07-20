class GameController < ApplicationController
  def index
    # This is a very simple game.  The game is to guess which of the 1000 numbers is the 1.
    session[:click_counter] ||= 0
    @click_counter = session[:click_counter]
    if params[:btn]
      if params[:btn] == '0'
        session[:click_counter] += 1
        render :index
      else
        redirect_to '/game/over'
      end
    else
      session[:click_counter] = 0
      session[:game_array] = Array.new(990, 0)
      10.times do 
        session[:game_array].insert(rand(0..989), 1)
      end
      @game_array = session[:game_array]
    end
  end

  def over

  end
end