class Public::HomesController < ApplicationController
  def top
  end

  def search
    @model = params['search']['model']
    @content = params['search']['content']
    @method = params['search']['method']
    @result = search_for(@model, @content, @method)
  end

  private

   def search_for(model, content, method)
    if model == 'user'
      if method == 'forward'
        User.where(
          'name LIKE ? ',
          "#{content}%"
        )
      elsif method == 'backward'
        User.where(
          'name LIKE ?',
          "%#{content}"
        )
      elsif method == 'perfect'
        User.where(
          'name = ? ',
          content
        )
      else # partial
        User.where(
          'last_name LIKE ?',
          "%#{content}%"
        )
      end
    elsif model == 'item'
      if method == 'forward'
        Plant.where('name LIKE ?', content + '%').includes(:genre)
      elsif method == 'backward'
        Plant.where('name LIKE ?', '%' + content).includes(:genre)
      elsif method == 'perfect'
        Plant.where(name: content).includes(:genre)
      else # partial
        Plant.where('name LIKE ?', '%' + content + '%').includes(:genre)
      end
    else
      [] # 空配列を返す
    end
   end
end
