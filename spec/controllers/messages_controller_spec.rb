require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:messages) { user.messages }
  let(:message) { user.messages.first }
  let(:group) { user.groups.first }
  describe 'GET #index' do

    context 'user signed_in' do
      before do
        login_user user
        get :index, params: { group_id: group.id }
      end

      it "assigns the requested messages to @messages" do
        expect(assigns(:messages)).to eq messages
      end

      it "assigns the requested messages to @message" do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "assigns the requested messages to @group" do
        expect(assigns(:group)).to eq group
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end
    context 'user signed_out' do
      it "redirect_to sign_in templete" do
      	get :index, params: { group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
  	context 'user signed_in' do
      before do
      	login_user user
      end

      it "saves new message" do
        expect{ post :create, params: {message: attributes_for(:message), group_id: group.id}}.to change(Message, :count).by(1)
      end

      it "can't save new message" do
        expect{ post :create, params: {message: attributes_for(:message, body: "", image: ""), group_id: group.id}}.to change(Message, :count).by(0)
      end

      it "when can't save new message flash[:alert]" do
        post :create, params: {message: attributes_for(:message, body: "", image: ""), group_id: group.id}
        expect(flash[:alert]).to include("を入力してください")
      end

      it "save message redirects" do
        post :create, params: {message: attributes_for(:message), group_id: group.id}
        expect(response).to redirect_to group_messages_path
      end

      it "can't save message render" do
        post :create, params: {message: attributes_for(:message,body: "", image: ""), group_id: group.id}
        expect(response).to render_template :index
      end
    end
    context 'user signed_out' do
      it "redirect_to sign_in templete" do
        post :create, params: {message: attributes_for(:message), group_id: group.id}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end

