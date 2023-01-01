class SplashController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  def index
  end
end
