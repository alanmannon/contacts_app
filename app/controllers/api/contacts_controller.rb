class Api::ContactsController < ApplicationController
  def contact_1
    @contact_1 = Contact.first
    render "contact_1.json.jb"
  end

  def all_contacts
    @all_contacts = Contact.all
    render "all_contacts.json.jb"
  end
end
