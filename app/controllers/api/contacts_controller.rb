class Api::ContactsController < ApplicationController

  def index
    @contacts = current_user.contacts

    search_first_name = params[:first_name]
    if search_first_name
      @contacts = @contacts.where("name ILIKE ?", "%" + search_name + "%")
    end


    render "index.json.jbuilder"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    "render show.json.jbuilder"
  end

  def create
    @contact =Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      middle_name: params[:middle_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio],
      user_id: current_user.id
      )
    if @contact.save
      render "show.json.jbuilder"
    else 
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    if @contact.save
      render "show.json.jbuilder"
    else 
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: {message: "Contact successfully destroyed."}
  end
end

  
  





