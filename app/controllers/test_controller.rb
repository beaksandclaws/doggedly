class TestController < ActionController::Base
  include StatesHelper

  def new_review
    @review = Review.new
    @places = Place.all
  end

  def create_review
    review_params = params.require(:review).permit(:rating,:content,:place_id,:user_id)
    @review = Review.new(review_params)
    if @review.save!
      flash[:alert] = 'Save successful :D'
      redirect_to root_url
    else
      flash[:alert] = 'Save unsuccessful :/'
      redirect_to 'new_review'
    end
  end

  def new_photo
    @photo = Photo.new
    @places = Place.all
  end

  def create_photo
    photo_params = params.require(:photo).permit(:image,:user_id)
    @place = Place.find(params[:photo][:imageable_id])

    @photo = @place.photos.create(photo_params)

    if @photo.save!
      flash[:alert] = 'Save successful :D'
      redirect_to root_url
    else
      flash[:alert] = 'Save unsuccessful :/'
      redirect_to 'new_review'
    end
  end

  def new_place
    @place = Place.new
    @cities = City.all
  end

  def create_place
    place_params = params.require(:place).permit(:name,:city_id,:location_info,:alcohol,:hours,:how_enter,:food,:waterbowl,:useful_tips,:has_wifi)
    @place = Place.new(place_params)
    if @place.save!
      flash[:alert] = 'Save successful :D'
      redirect_to root_url
    else
      flash[:alert] = 'Save unsuccessful :/'
      redirect_to 'new_place'
    end
  end

  def new_city
    @city = City.new
  end

  def create_city
    city_params = params.require(:city).permit(:name,:state)
    @city = City.new(city_params)
    if @city.save!
      flash[:alert] = 'Save successful :D'
      redirect_to root_url
    else
      flash[:alert] = 'Save unsuccessful :/'
      redirect_to 'new_city'
    end

  end

end