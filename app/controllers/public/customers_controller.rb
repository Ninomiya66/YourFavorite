class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render :edit
    end
  end

  def check
  end

  def out
    @customer = current_customer
    @customer.update(is_active: true)
    reset_session
    flash[:notice] = "退会処理が完了しました。"
    redirect_to root_path
  end

  # ストロングパラメータ
  private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end

end
