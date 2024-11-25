class ComplimentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @compliment = Compliment.order("RANDOM()").first
    if @compliment.nil?
      @compliment = Compliment.new(message: "No compliments available yet!")
    end
  end

  def new
    @compliment = Compliment.new
  end

  def create
    @compliment = Compliment.new(compliment_params)
    if @compliment.save
      redirect_to root_path, notice: "Compliment created successfully!"
    else
      render :new, alert: "There was an error creating the compliment."
    end
  end

  private

  def compliment_params
    params.require(:compliment).permit(:message)
  end

end
