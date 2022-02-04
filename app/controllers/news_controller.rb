class NewsController < ApplicationController
  before_action :set_news, only: [:show, :print]

  def index
    @news = ContentBuilder.list_all.page(params[:page]).per(10)

    @description = "Acesse pare ver as últimas nóticias"
    #page_info("Notícias")
  end

  def show
    @news_categories = ContentBuilderCategory.includes(:content_builders).order(name: "asc")
    @last_news = ContentBuilder.list_all.page(params[:page]).per(5)

    page_info(@news.title, @news.cover_list)
    @page_description = @news.summary
    @page_type = "article"
    @page_article_author = @news.written_by
    @page_article_section = @news.content_builder_category.name
    @page_article_published_time = @news.date_publish.iso8601
    # logo(@news)
  end

  def list_by_category
    @news = ContentBuilder.list_by_category(params[:category]).page(params[:page]).per(10)
    @category_news = ContentBuilderCategory.show(params[:category])

    # page_info(@category_news)

    render "index"
  end

  def print 
    reder layout: false
  end

  def search
    q = params[:q]

    order = {}
    order[:date_publish] = "desc"

    @news = ContentBuilder.search(q, order: order)
    
    # page_info("Busca de notícias")
    # @description = "Acesse pare ver as últimas nóticias"

    render "index"
  end

  # def logo(news)
  #   news.cover_list
  # end

  def most_read
    @most_read = ContentBuilder.left_joins(:content_builder_count_reads).group(:id).order("COUNT(content_builder_count_reads.id) desc")
  end

  private

  def set_news
    @news = ContentBuilder.find_by_slug(params[:slug])
    @news.content_builder_count_reads.create(ip: request.remote_ip)
  end
end
