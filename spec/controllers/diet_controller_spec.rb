require 'rails_helper'

RSpec.describe DietsController, type: :controller do
  describe 'GET diets#index' do
    let(:user) { FactoryBot.create(:user) }

    context 'when the user is logged in' do
      it 'returns a 200' do
        sign_in user
        get :index
        expect(response).to be_successful
      end
    end

    context 'when the user is not logged in' do
      it 'should redirect to log in page' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET diets#show" do
    it "should return 200" do
      user = FactoryBot.create(:user)
      diet = FactoryBot.create(:diet, user: user)

      sign_in user

      get :show , params: { id: user.diets.first.id }
      expect(response).to be_successful
    end
  end

  describe "GET diets#edit" do
    it "should return 200" do
      user = FactoryBot.create(:user)
      diet = FactoryBot.create(:diet, user: user)

      sign_in user

      get :edit , params: { id: user.diets.first.id }
      expect(response).to be_successful
    end
  end

  describe "GET diets#new" do
    let(:user) { FactoryBot.create(:user) }

    it "should return 200" do
      sign_in user
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST diets#create" do
    context "with valid attributes" do
      it "should save the new diet in the database" do
        user = FactoryBot.create(:user)

        sign_in user

        expect { post :create, params: { diet: {
          name: 'My diet',
          date: Date.today + 3,
          meal_ids: []
          }
        }
        }.to change(Diet, :count).by(1)
      end

      it "should redirect to the diets#show page" do
        user = FactoryBot.create(:user)
        sign_in user

        post :create, params: { diet: {
          name: 'My diet',
          date: Date.today + 3,
          meal_ids: []
          }
        }

        expect(response).to redirect_to(diet_path(Diet.last))
      end

    end

    context "with invalid attributes" do
      it "should not save the new diet in the database" do
        user = FactoryBot.create(:user)
        sign_in user

        post :create, params: { diet: {
          name: 'My test diet',
          date: Date.today - 1,
          meal_ids: []
          }
        }

        expect(Diet.count).to eq(0)
      end

      it "should render diets#new template" do
        user = FactoryBot.create(:user)
        sign_in user

        post :create, params: { diet: {
          name: 'My diet',
          date: Date.today - 5,
          meal_ids: []
          }
        }

        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT diets#update" do
    it "should update an existing diet" do
      user = FactoryBot.create(:user)
      diet = FactoryBot.create(:diet, user: user)
      sign_in user

      expect {
        put :update,
        params: { id: diet.id, diet: {
          name: 'new diet',
          date: Date.today + 5,
          meal_ids: []
          } }
      }.to change { diet.reload.name }.from(diet.name).to('new diet')
    end
  end

  describe "DELETE diets#destroy" do
    it "should delete a diet" do
      user = FactoryBot.create(:user)
      diet = FactoryBot.create(:diet, user: user)
      sign_in user

      expect { delete :destroy, params: { id: diet.id } }.to change(Diet, :count).by(-1)
    end
  end
end