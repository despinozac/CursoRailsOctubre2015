class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
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

  private

  def permit_params
    params.require(:person).permit(:name, :lastname, :birthday, :gender, :ci)
  end
end
