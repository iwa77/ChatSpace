require 'rails_helper'
       
  describe MessagesController do
    let(:group) { create(:group, users: [@user]) }
    let(:not_login_group) { create(:group)}
    let(:messages){create_list(:message, 3, user: user, group: group)}
    

    describe 'GET #index' do

      context "login.ver" do
        before do
          login_user

          get :index, { group_id: group.id }
        end

        it "render-template:index" do
          expect(response).to render_template :index
        end

        it "assigns the requested messages to @messages" do
          messages = group.messages
          expect(assigns(:messages)).to match messages
        end

        it "assigns the requested groups to @groups" do
          get :index, { group_id: group.id }
          groups = @user.groups
          expect(assigns(:groups)).to eq groups
        end
      
        it "assigns the requested group to @group" do
          expect(assigns(:group)).to eq group
        end

        it "assigns the requested users to @users" do
          users = group.users
          expect(assigns(:users)).to match users
        end
      end

      context "not-login.ver" do

        it "redirect_to(new_user_session_path)" do
          get :index, group_id: not_login_group.id 
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

    describe 'POST #create' do

      context "login.ver" do
        before do
          login_user
          post :create, group_id: group.id, message: attributes_for(:message)
        end      

        context "with valid params situation" do
          let(:params) { {group_id: group.id, message: { body: "this-is-message" }} }

          it "redirect_to(group_messages_path)" do
            expect(response).to redirect_to(group_messages_path)
          end

          it"create new message" do
            expect { post :create, params }.to change{ Message.count }.by(1)
          end
        end

        context "with invalid params situation" do
          let(:params) { {group_id: group.id, message: { body: "" }} }

          it "returns a success response" do
            post :create, params
            expect { post :create, params }.to change{ Message.count }.by(0)
          end
        end
      end

      context "not-login.ver" do

        it "redirect_to(new_user_session_path)" do
          post :create, group_id: not_login_group.id, message: attributes_for(:message)
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end

