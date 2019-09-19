class ContactsController < ApplicationController
  
  def index
    redirect_to new_contact_path
  end
    
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params.require(:contact).permit(:name, :email, :content))
    if @contact.save
    redirect_to new_contact_path,
    notice:"Contact information saved."
    else
    render "new"
    end
  end

end
