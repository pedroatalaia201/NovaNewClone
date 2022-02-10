class SearchController < ApplicationController
  #layout "application_no_google_news"

  def index
    @msg = ""

    @page_title = "Busca"

    #@most_read = ContentBuilder.self.count_read.order_by("ASC").limit(5)
  end
  
  def search
    @msg = ""

    q = params[:q]

    order = {}
    order_album = {}

    conditional = {}

    order[:date_publish] = "desc"

    conditional[:status] = true

    content_builder = ContentBuilder.search(q, operator: "and", where: conditional, order: order)
    albums = Album.search(q, order: order)

    array_search = []

    albums.each do |n|
      array_search << {
        name: n.name,
        slug: n.slug,
        date_publish: n.date_publish.strftime("%d/%m/%Y"),
        type: 2
      }
    end

    content_builder.each do |n|
      array_search << {
        title: n.title,
        category: n.category.slug,
        slug: n.slug,
        date_publish: n.date_publish.strftime("%d/%m/%Y"),
        type: 1
      }
    end

    @result_search_size = array_search.size

    @result_search = Kaminari.paginate_array(
      array_search, total_count: @result_search_size
    ).page(params[:page])

  end
end
