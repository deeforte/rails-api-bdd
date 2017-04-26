# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ArticlesController do
  def article_params
    {
      title: 'One Weird Trick',
      content: 'You won\'t believe what happens next...'
    }
  end

  def article
    Article.first
  end

  before(:all) do
    Article.create!(article_params)
  end

  after(:all) do
    Article.delete_all
  end

  describe 'GET index' do
    before(:each) do
      get :index
    end
    it 'is successful' do
      expect(get(:index)).to be_success
    end

    it 'renders a JSON response' do
      # setup
      articles_collection = JSON.parse(response.body)
      # action
      # assert
      expect(articles_collection).not_to be_nil
      expect(articles_collection.first['title']).to eq(article['title'])
    end
  end

  describe 'GET show' do
    before(:each) do
      get :show, params: { id: article.id }
    end
    it 'is successful' do
      expect(response).to be_success
    end

    it 'renders a JSON response' do
      article_collection = JSON.parse(response.body)
      # action
      # assert
      expect(article_collection).not_to be_nil
      expect(article_collection['title']).to eq(article['title'])
    end
  end

  describe 'DELETE destroy' do
    skip 'is successful and returns an empty response' do
    end
  end

  describe 'PATCH update' do
    def article_diff
      { title: 'Two Stupid Tricks' }
    end

    before(:each) do
      patch :update, id: article.id,
                     params: { article: article_diff }
    end

    skip 'is successful' do
    end

    skip 'renders a JSON response' do
    end
  end

  describe 'POST create' do
    before(:each) do
      post :create, params: { article: article_params }
    end

    skip 'is successful' do
    end

    skip 'renders a JSON response' do
    end
  end
end
