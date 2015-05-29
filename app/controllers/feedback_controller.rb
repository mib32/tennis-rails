class FeedbackController < ApplicationController
  def create
    FeedbackMailer.simple(params[:feedback]).deliver
  end
end
