require 'rails_helper'

RSpec.describe '/teams', type: :request do
  let!(:trainer) { create(:trainer) }
  before { sign_in(trainer) }

  let!(:team) { create(:team) }

  let!(:valid_attributes) { build(:team).attributes }

  describe 'GET /index' do
    it 'renders a successful response' do
      get teams_url
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_team_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      get edit_team_url(team)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new team' do
        expect do
          post teams_url, params: { team: valid_attributes }
        end.to change(Team, :count).by(1)
      end

      it 'redirects to the created team' do
        post teams_url, params: { team: valid_attributes }
        expect(response).to redirect_to(team_url(Team.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Team' do
        expect do
          post teams_url, params: { team: { name: nil } }
        end.to change(Team, :count).by(0)
      end

      it 'renders a erro 422' do
        post teams_url, params: { team: { name: nil } }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { build(:team).attributes }

      it 'updates the requested team' do
        patch team_url(team), params: { team: new_attributes }
        team.reload
        expect(team.name) == (new_attributes['name'])
      end

      it 'redirects to the team' do
        patch team_url(team), params: { team: new_attributes }
        team.reload
        expect(response).to redirect_to(team_path)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested team' do
      expect do
        delete team_url(team)
      end.to change(Team, :count).by(-1)
    end

    it 'redirects to the teams list' do
      delete team_url(team)
      expect(response).to redirect_to(teams_url)
    end
  end
end
