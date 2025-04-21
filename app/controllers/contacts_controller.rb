class ContactsController < ApplicationController
  before_action :set_contact, only: [ :destroy, :update, :show ]

  def index
    @contacts = Contact.all.as_json(only: index_params)
    render json: @contacts, status: :ok
  end

  def show
    if @contact.nil?
      render json: {}, status: :no_content
    else
      render json: @contact.as_json(only: show_params), status: :ok
    end
  end

  def create
    if Company.first.nil?
      Company.create!(
        name: "Apple",
        phone: "08000",
        address: "Brasil",
        email: "apple@email.com",
        industry: "Cell Phones",
        website: "apple.com",
        )
    end

    @company = Company.first!

    @contact = Contact.new(create_params)
    @contact.company_id = @company.id

    if @contact.save
      render json: @contact.as_json(only: show_params), status: :created
    else
      render json: @contact.errors, status: :unprocessable_content
    end
  end

  def destroy
    @contact.destroy
    render json: {}, status: :no_content
  end

  def update
    if @contact.update(update_params)
      render json: @contact, status: :ok
    else
      render json: @contact.errors, status: :unprocessable_content
    end
  end


  private
  def index_params
    [ :id, :first_name, :last_name, :email, :phone, :birthday ]
  end

  private
  def show_params
    [ :id, :first_name, :last_name, :email, :phone, :birthday ]
  end

  private
  def create_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :birthday)
  end

  private
  def update_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :birthday)
  end

  private
  def set_contact
    @contact = Contact.find(params[:id])
  end

end
