class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new  
  end
  
  def create
    @blog = Blog.new(blog_params)    # 上記のプログラムをさらに修正してmodelからのバリデーション適用。
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "ブログを作成しました！" #上記のリダイレクトをさらに修正してバリデーションの分岐に対応させた。noticeについてはrailsの29章参照
      else
        render :new
      end
    end
  end

  def show
    @blog = Blog.find(params[:id]) 
  end

  def edit    #privateの下に入れたらエラーになった。こういうエラーはありがちな気がするので注意しよう。
    @blog = Blog.find(params[:id])
  end 

  def update    #privateの下に入れたらエラーになった。こういうエラーはありがちな気がするので注意しよう。
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy #アクション名のdestroyとは異なり、こちらはモデルに対してのメソッドです。
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?  
  end
  
  private #Strong Parameters 以外のメソッドは private よりも上に記述しましょう。
  def blog_params #blog_paramsとして、メソッドを定義し、それを呼び出すことで、いろいろな場所からの利用を可能にしています。また、privateメソッドの配下に設定して呼び出すようにしております。
      params.require(:blog).permit(:title, :content)
  end

 
end