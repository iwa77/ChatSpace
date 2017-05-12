require 'rails_helper'
       
  describe MessagesController do
    let(:group) { create(:group) }
    let(:message) { create(:message) }
    

    describe 'GET #index' do

      it "ログインしていないときのビュー" do
        get :index, group_id: group.id 
        expect(response).to redirect_to(new_user_session_path)
      end

      it "ログインしているときのビュー" do
        login_user
        get :index, { group_id: group }
        expect(response).to render_template :index
      en 
   end

    describe 'POST #create' do
   
      it "ログインしていない場合のビュー" do
        post :creat, group_id: group.id, message: attributes_for(:message)
        expect(response).to redirect_to(new_user_session_path)
      end

      it "ログインしている場合のビュー" do
        login_user
        post :create, group_id: group.id, message: attributes_for(:message)
        expect(response).to redirect_to(group_messages_path)
      end
    end
  end