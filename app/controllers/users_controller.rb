class UsersController < ApplicationController
  before_action :set_user, only: [:add_money]

  def add_money
    @user.balance += params[:amount].to_f
    @user.save!
    render json: {:message => "Added amount successfully in the account"}, status: 200
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role)
  end
end
