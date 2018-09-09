class Api::UsersController < ApplicationController
  def create
    user = User.new(
                    name: params[:name],
                    email: params[:email],
                    password_digest: params[:password],
                    password_confirmation: params[:password_confirmation]
                    )
    if user.save
      render json: {message: "User sucessfully created"}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end
end
