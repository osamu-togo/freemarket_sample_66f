require 'rails_helper'

describe Users::RegistrationsController, type: :controller do
  let!(:user){ create(:user)}
  let!(:address){ create(:address)}

  describe 'GET #index' do
    #before do
     # login_user user
    #end

    #context "when user login" do
      #it "login user" do
     # end
   #end
  

    context "when not login" do
      it "new template" do
        redirect_to new_user_registration_path
      end
    end
  end
end
