require 'spec_helper'

describe Api::V2::UnreadEntriesController do
  before do
    create_user

    @request.headers['Authorization'] = basic_auth(@user)
  end

  it 'should get unread entries' do
    make_dependencies!

    get :index, format: :json
    JSON.parse(response.body).length.should eq 2
  end

  pending 'should create unread entries' do
    make_dependencies!

    @request.headers['Content-Type'] = "application/json; charset=utf-8"
    assert_difference 'UnreadEntry.count' do
      post :create, unread_entries: [], format: :json
    end
  end

  pending 'should destroy unread stories' do
    make_dependencies!

    assert_difference 'UnreadEntry.count', -1 do
      post :destroy, unread_entries: [], format: :json
    end
  end

  def make_dependencies!
    @feed = FactoryGirl.create(:feed)
    @entry = FactoryGirl.create(:entry, :feed => @feed)
    @entry_2 = FactoryGirl.create(:entry, :feed => @feed)
    @unread_entry = FactoryGirl.create(:unread_entry, :user => @user, :feed => @feed, :entry => @entry, :published => true)
    @unread_entry_2 = FactoryGirl.create(:unread_entry, :user => @user, :feed => @feed, :entry => @entry_2, :published => true)
  end
end
