require "rails_helper"
RSpec.describe HomesController do
  fixtures :all

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect render_template :index
    end
  end

  describe "Create/Edit List" do
    it "create list" do
      post :meta_form, :params => {type: 'create_list', content: 'List 1'}, format: 'JS'
      expect(List.last.content).to eq "List 1"
    end
    it "edit list" do
      post :meta_form, :params => {type: 'edit_list', content: 'List Edited 1', list_id: 1}, format: 'JS'
      expect(List.find(1).content).to eq "List Edited 1"
    end
    it "create list item" do
      post :meta_form, :params => {type: 'create_list_item', content: 'List Item 1', list_id: 1}, format: 'JS'
      expect(ListItem.last.content).to eq "List Item 1"
    end
    it "edit list item" do
      post :meta_form, :params => {type: 'edit_list_item', content: 'List Item Edited 1', list_id: 1}, format: 'JS'
      expect(ListItem.find(1).content).to eq "List Item Edited 1"
    end
  end

  describe "Trash" do
    it "soft/temporary delete list" do
      post :trash_list, :params => {id: 1}, format: 'JS'
      expect(List.find(1).is_trash).to eq true
    end
    it "hard/permanent delete list" do
      post :trash_list, :params => {id: 2}, format: 'JS'
      expect(List.find_by_id(2)).to eq nil
      expect(ListItem.find_by_id(2)).to eq nil
    end
    it "soft/temporary delete list item" do
      post :trash_list_item, :params => {id: 1}, format: 'JS'
      expect(ListItem.find(1).is_trash).to eq true
    end
    it "hard/permanent delete list" do
      post :trash_list_item, :params => {id: 2}, format: 'JS'
      expect(ListItem.find_by_id(2)).to eq nil
    end
  end

  describe "Restore" do
    it "restore list" do
      post :restore_list, :params => {id: 2}, format: 'JS'
      expect(List.find(2).is_trash).to eq false
    end
    it "restore list item" do
      post :restore_list_item, :params => {id: 2}, format: 'JS'
      expect(ListItem.find(2).is_trash).to eq false
    end
    it "restore all" do
      post :restore_all, format: 'JS'
      expect(List.active.count).to eq List.count
      expect(ListItem.active.count).to eq ListItem.count
    end
  end
end