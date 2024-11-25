class ComplimentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_compliment, only: [:edit, :update]

  def index
    @compliment = Compliment.order("RANDOM()").first
    @compliments = Compliment.all
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
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @compliment.update(compliment_params)
      redirect_to root_path, notice: "Compliment updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_compliment
    @compliment = Compliment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Compliment not found."
  end

  def compliment_params
    params.require(:compliment).permit(:message)
  end
end
