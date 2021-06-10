class HomeController < ApplicationController
  def index
    @character = Character.first
    @character2 = "nǐ"
  end
end
