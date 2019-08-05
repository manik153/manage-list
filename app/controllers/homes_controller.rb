class HomesController < ApplicationController
  def index
  	@active = List.active
    @trashed = List.trashed
  	@trashed_items = ListItem.trashed.where('list_id NOT IN (?)', @trashed.pluck(:id).push(0))
  end

  def meta_form
    @meta_form_type = params[:type].to_s
    @content = params[:content].to_s
  	@list_id = params[:list_id].to_s
  	case @meta_form_type
  	when 'create_list'
  		@list = List.create(content: @content)
    when 'edit_list'
      @list = List.find_by_id(@list_id).update_attribute(:content, @content)
	  when 'create_list_item'
  		@list_item = ListItem.create(content: @content, list_id: @list_id)  		
    when 'edit_list_item'
      @list_item = ListItem.find_by_id(@list_id).update_attribute(:content, @content)     

  	end
  end

  def trash_list
    @trashed_id = params[:id]
    list = List.find_by_id(@trashed_id)
    if list.is_trash
      status = list.destroy
    else
      status = list.update_attribute(:is_trash, true)
    end
    @trashed = List.trashed
    @trashed_items = ListItem.trashed.where('list_id NOT IN (?)', @trashed.pluck(:id).push(0))
  end

  def trash_list_item
    @trashed_id = params[:id]
    list_item = ListItem.find_by_id(@trashed_id)
    if list_item.is_trash
      status = list_item.destroy
    else
      status = list_item.update_attribute(:is_trash, true)
    end
    @trashed = List.trashed
    @trashed_items = ListItem.trashed.where('list_id NOT IN (?)', @trashed.pluck(:id).push(0))
  end

  def restore_list
    @trashed_id = params[:id]
    list = List.find_by_id(@trashed_id)
    status = list.update_attribute(:is_trash, false)
    @active = List.active
  end

  def restore_list_item
    @trashed_id = params[:id]
    list_item = ListItem.find_by_id(@trashed_id)
    status = list_item.update_attribute(:is_trash, false)
    @active = List.active
  end

  def restore_all
    List.update_all(is_trash: false)
    ListItem.update_all(is_trash: false)
    @active = List.active
  end
end
