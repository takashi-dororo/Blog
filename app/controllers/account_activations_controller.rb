class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:id])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in(user)
      flash[:success] = "アカウントは有効になりました"
      redirect_to(user)
    else
      flash[:danger] = "リンクは無効です"
      redirect_to(root_url)
    end
  end
end
