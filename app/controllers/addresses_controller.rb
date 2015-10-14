class AddressesController < ApplicationController

  def destroy
    address = Address.find(params[:id])

    if address.destroy
      redirect_to person_path(params[:person_id])
    else
      #muestro mensaje de error
      redirect_to person_path(params[:person_id])
    end
  end
end
