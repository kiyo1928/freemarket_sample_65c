class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update]

  def update
    @address = @user.address
    @address.update(building: params[:address][:building])
    redirect_to edit_user_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def address_attributes
      params.require(:address).permit(:building)
    end
end