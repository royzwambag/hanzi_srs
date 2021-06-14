class ApplicationController < ActionController::Base
  before_action :check_rack_mini_profiler

  def check_rack_mini_profiler
    if true # TODO: Only run this for admin users! 
      Rack::MiniProfiler.authorize_request
    end
  end
end
