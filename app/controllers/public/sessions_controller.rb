# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_status, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected

  def customer_status #退会しているかを判断するメソッド
    #入力されたemailからアカウントを１件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    #アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    #取得したアカウントのパスと入力されたパスが一致しているか && customerのis_deletedがtrueか 判別
    if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted == true
      #全て当てはまった場合はabout_pathに飛ぶ
       redirect_to about_path
    end
  end
end
