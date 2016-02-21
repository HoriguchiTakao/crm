class CustomersController < ApplicationController
  # それぞれのactionの前に呼ばれる
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:edit, :new]
  #認証しているかどうかを判断する(deviseのメソッド)
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]

  def index
    # kaminariを入れたので.pageが使える
    @customers = Customer.page(params[:page])
  end

  def show
    @comment = Comment.new
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
        # true
        redirect_to @customer

      else
        # false
        render :new
      end
  end

  def update
    if @customer.update(customer_params)
      #true
    redirect_to @customer
  else
    #false
    render :edit
  end
  end

  def edit
  end

  def destroy
    @customer.destroy
    redirect_to customers_url
  end
  # -----------------------------ここからprivate----------------------------------------
  private
  def customer_params
    params.require(:customer).permit(:family_name, :given_name, :email, :company_id)
  end

  def set_customer
  @customer = Customer.find(params[:id])
  end

  def set_company
  @companies = Company.all
  end

end
