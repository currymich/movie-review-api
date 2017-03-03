class UsersController < ApplicationController
  before_action :authorize, except: [:login, :create]

  def reviews
    render json: {reviews: User.find(params[:id]).reviews}
  end

  def create
    user = User.new(user_params)
    if user.save && user.authenticate(params[:user][:password])
      token = token(user.id, user.email)

      render json: {status: 200, message: "user created and logged in", user: user, token: token}
    else
      render json: {status: 422, user: user.errors}
    end
  end

  def show
    render json: {status: 200, user: current_user}
  end

  def login
    if params[:user][:email_username].include? "@"
      user = User.find_by(email: params[:user][:email_username])
    else
      user = User.find_by(username: params[:user][:email_username])
    end

    if user && user.authenticate(params[:user][:password])
      token = token(user.id, user.email)

      render json: {status: 201, user: user, message: "user logged in", token: token}
    else
      render json: {status: 401, message: "unauthorized"}
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: {status: 201, user: user}
    else
      render json: {status: 422}
    end
  end

  private

  def token(id, email)
    JWT.encode(payload(id, email), 'someawesomesecret', 'HS256')
  end

  def payload(id, email)
    {
      exp: (Time.now + 1.day).to_i,
      iat: Time.now.to_i,
      iss: 'wdir-matey',
      user: {
        id: id,
        email: email
      }
    }
  end

  def user_params
    params.required(:user).permit(:email, :password, :username, :name)
  end

end
