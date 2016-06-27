require 'rails_helper'

describe UsersController, :type => :controller do
 
 before do
     @user1 = FactoryGirl.create(:user)
     @user2 = FactoryGirl.create(:user)
   #@user1 = User.create!(email: "potato2@example.com", password: "123456")
   #@user2 = User.create!(email: "kartofel1@example.com", password: "1234567")
 end

 describe "GET #show" do
   context "User is logged in" do  
     before do
       sign_in @user1
     end

     it "loads correct user details"   do
       get :show, id: @user1.id
       expect(response).to have_http_status(200)
       expect(assigns(:user)).to eq @user1
     end
   end
 

   context "No user is logged in" do
     it "redirects to login" do
       get :show, id: @user1.id
       expect(response).to redirect_to(new_user_session_path)
     end
   end
     
   context "Attempt to access show page of user2" do
     it "redirects to login" do
       get :show, id: @user2.id 
       expect(assigns(:user)).not_to eq @user2
       expect(response).to redirect_to(new_user_session_path)
     end
   end
 end
end