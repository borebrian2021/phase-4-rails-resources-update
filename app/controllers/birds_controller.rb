class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end


  def increment_likes
    like=Bird.find(params[:id])
    if like
      like.update(like: like.likes+1)
      render json: like
    else
      render json:{error:"Not found"},status: :not_found
  end
  

#UPDATE /birds/:id
def update
  bird = Bird.find_by(id: params[:id])
  if bird
    bird.update(bird_params)
    render json: bird
  else
    render json: { error: "Bird not found" }, status: :not_found
  end
end

def bird_params
  params.permit(:name, :species, :likes)
end
end