class StaticPagesController < ApplicationController
  def home
    @location = []
    @user_id = []
    @content = []
    @foodtype = []
    for mp in Micropost.all
      @location.push(mp.location)
      @content.push(mp.content)
      @user_id.push(mp.user_id)
      @foodtype.push(mp.foodtype)
      
    end
    
    @user_name = []
    if @user_id != []
      for id in @user_id
        @user_name.push((User.find(id)).name)
      end
    end
    
  end

  def help
    
  end
  
  def menu
    @location = []
    @user_id = []
    @content = []
    @foodtype = []
    for mp in Micropost.all
      @location.push(mp.location)
      @content.push(mp.content)
      @user_id.push(mp.user_id)
      @foodtype.push(mp.foodtype)
    end
    @user_name = []
    if @user_id != []
      for id in @user_id
        @user_name.push((User.find(id)).name)
      end
    end
  end
end
