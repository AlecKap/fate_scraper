class RiddlesController < ApplicationController
  def show
    @riddle = Riddle.all.sample
  end
end
