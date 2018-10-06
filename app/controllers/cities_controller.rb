class CitiesController < ApplicationController

  def view
    @cities_dict = City.all
    @city = params[:city]
    @cities_list = @cities_dict.keys

  end

  def create
    @cities_dict = City.all
    @cities_list = @cities_dict.keys
    if (params[:name]) \
      && (params[:population]) \
     && (params[:landmark])
      @city = params[:name]
      @population = params[:population]
      @landmark = params[:landmark]
    else
      redirect_to "/cities/new"
    end

    if not @cities_list.include? @city.to_sym
      city = City.new(
      name: @city,
      landmark: @landmark,
      population: @population)

      city.save
    end
    redirect_to "/cities/view"
  end

  def update_get
    @city = params[:city]
  end

  def update_post
    @city = City.all[params[:city].to_sym]
    @city.update(params)
    redirect_to "/cities/view"
  end

end