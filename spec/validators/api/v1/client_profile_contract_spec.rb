# frozen_string_literal: true

require 'spec_helper'
require './app/domain/validators/api/v1/client_profile_contract'

RSpec.describe ::Validators::Api::V1::ClientProfileContract, dbclean: :after_each do
  let(:valid_params) do
    {
      marital_status: '1',
      veteran_status: '1',
      education: '1',
      employment: '1',
      not_in_labor: '1',
      income_source: '1',
      pregnant: '1',
      school_attendance: '1',
      legal_status: '1',
      arrests_past_30days: '1',
      self_help_group_attendance: '1',
      health_insurance: '1'
    }
  end

  context 'Passed with invalid params return error' do
    it 'with no marital_status' do
      valid_params[:marital_status] = nil
      result = subject.call(valid_params)
      expect(result.failure?).to be_truthy
      expect(result.errors.to_h).to have_key(:marital_status)
      expect(result.errors.to_h[:marital_status].first).to eq 'must be filled'
    end
    it 'with invalid marital_status' do
      valid_params[:marital_status] = 'not a real status'
      result = subject.call(valid_params)
      expect(result.failure?).to be_truthy
      expect(result.errors.to_h).to have_key(:marital_status)
      expect(result.errors.to_h[:marital_status].first).to eq 'must be one of: 1, 2, 3, 4, 5, 97, 98'
    end
    it 'with no veteran_status' do
      valid_params[:veteran_status] = nil
      result = subject.call(valid_params)
      expect(result.failure?).to be_truthy
      expect(result.errors.to_h).to have_key(:veteran_status)
      expect(result.errors.to_h[:veteran_status].first).to eq 'must be filled'
    end
    it 'with invalid veteran_status' do
      valid_params[:veteran_status] = 'not a real status'
      result = subject.call(valid_params)
      expect(result.failure?).to be_truthy
      expect(result.errors.to_h).to have_key(:veteran_status)
      expect(result.errors.to_h[:veteran_status].first).to eq 'must be one of: 1, 2, 97, 98'
    end
    it 'with no education' do
      valid_params[:education] = nil
      result = subject.call(valid_params)
      expect(result.failure?).to be_truthy
      expect(result.errors.to_h).to have_key(:education)
      expect(result.errors.to_h[:education].first).to eq 'must be filled'
    end
    it 'with invalid education' do
      valid_params[:education] = 'not a real status'
      result = subject.call(valid_params)
      expect(result.failure?).to be_truthy
      expect(result.errors.to_h).to have_key(:education)
      expect(result.errors.to_h[:education].first).to eq 'must be one of: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 71, 72, 73, 74, 97, 98'
    end
    it 'with no employment' do
      valid_params[:employment] = nil
      result = subject.call(valid_params)
      expect(result.failure?).to be_truthy
      expect(result.errors.to_h).to have_key(:employment)
      expect(result.errors.to_h[:employment].first).to eq 'must be filled'
    end
    it 'with invalid employment' do
      valid_params[:employment] = 'not a real status'
      result = subject.call(valid_params)
      expect(result.failure?).to be_truthy
      expect(result.errors.to_h).to have_key(:employment)
      expect(result.errors.to_h[:employment].first).to eq 'must be one of: 1, 2, 3, 4, 5, 97, 98'
    end
    it 'with no not_in_labor' do
      valid_params[:not_in_labor] = nil
      result = subject.call(valid_params)
      expect(result.failure?).to be_truthy
      expect(result.errors.to_h).to have_key(:not_in_labor)
      expect(result.errors.to_h[:not_in_labor].first).to eq 'must be filled'
    end
    # it 'with invalid not_in_labor' do
    #  valid_params[:not_in_labor] = "not a real status"
    #  result = subject.call(valid_params)
    #  expect(result.failure?).to be_truthy
    #  expect(result.errors.to_h).to have_key(:not_in_labor)
    #  expect(result.errors.to_h[:not_in_labor].first).to eq 'must be one of: 1, 2, 3, 4, 5, 97, 98'
    # end
    it 'with no pregnant' do
      valid_params[:pregnant] = nil
      result = subject.call(valid_params)
      expect(result.failure?).to be_truthy
      expect(result.errors.to_h).to have_key(:pregnant)
      expect(result.errors.to_h[:pregnant].first).to eq 'must be filled'
    end
    it 'with invalid pregnant' do
      valid_params[:pregnant] = 'not a real status'
      result = subject.call(valid_params)
      expect(result.failure?).to be_truthy
      expect(result.errors.to_h).to have_key(:pregnant)
      expect(result.errors.to_h[:pregnant].first).to eq 'must be one of: 1, 2, 96, 97, 98'
    end
    it 'with no school_attendance' do
      valid_params[:school_attendance] = nil
      result = subject.call(valid_params)
      expect(result.failure?).to be_truthy
      expect(result.errors.to_h).to have_key(:school_attendance)
      expect(result.errors.to_h[:school_attendance].first).to eq 'must be filled'
    end
    it 'with invalid school_attendance' do
      valid_params[:school_attendance] = 'not a real status'
      result = subject.call(valid_params)
      expect(result.failure?).to be_truthy
      expect(result.errors.to_h).to have_key(:school_attendance)
      expect(result.errors.to_h[:school_attendance].first).to eq 'must be one of: 1, 2, 96, 97, 98'
    end
  end

  context 'Passed with valid required params' do
    it 'should see a success' do
      result = subject.call(valid_params)
      expect(result.success?).to be_truthy
    end
  end
end