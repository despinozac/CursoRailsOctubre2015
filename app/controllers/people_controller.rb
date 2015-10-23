class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end
  
  def new
    @person = Person.new
    @person.addresses.build
  end

  def create
    @person = Person.new(permit_params)

    if @person.save
      redirect_to people_path
    else
      render 'new'
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(permit_params)
      redirect_to people_path
    else
      render 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:id])

    @person.destroy

    redirect_to people_path
  end

  #Esta no es la mejor forma. Ugly...
  def form_address
    @address = Person.find(params[:id]).addresses.build
  end

  def add_address
    person = Person.find(params[:id])
    @address = person.addresses.build(permit_params_address)

    if person.save
      redirect_to people_path
    else
      render 'form_address'
    end
  end
  #End of ugly shit

  private

  def permit_params
    params.require(:person).permit(:name, :lastname, :birthday, :gender, :ci, 
      addresses_attributes: [:id, :line1, :line2, :city, :country, :zipcode])
  end

  def permit_params_address
    params.require(:address).permit(:line1, :line2, :country, :city, :zipcode)
  end
end
