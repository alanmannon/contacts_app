class Api::ContactsController < ApplicationController
  def index
    @contacts = current_user.contacts
    render "index.json.jb"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    if current_user && current_user.id == @contact.user_id
      render "show.json.jb"
    else
      render json: { error: "please login" }
    end
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      user_id: current_user.id,
    )
    if @contact.save
    end
    render "show.json.jb"
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
    )
    @contact.save
    render "show.json.jb"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: { message: "contact deleted" }
  end
end
