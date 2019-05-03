# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def index
    if user_session
      @proprietor = current_user.proprietor
      @homes = @proprietor.homes.all if @proprietor.present?
    end
  end
end
