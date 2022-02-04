class ContentBuilder < RailsAdminContentBuilder::ContentBuilder
    validates :content_builder_category, presence: true
  
    #searchkick batch_size: 50, index_prefix: "clonenews"
  
    belongs_to :content_builder_category
  
    has_many :content_builder_count_reads, dependent: :destroy
    has_many :content_builder_archives, dependent: :destroy
  
    accepts_nested_attributes_for :content_builder_archives, allow_destroy: true
  
    def category
      content_builder_category
    end
  
    def subcategory
      content_builder_subcategory
    end
  
    def count_read
      content_builder_count_reads.count
    end
  
    def cover_list
      html ||= Nokogiri::HTML.fragment(content)
      if html.css("img").present?
            html.css("img").first["src"]
      end
    end
  
    def hour_publish
      date_publish.strftime("%H:%M")
    end
  
    def self.time_now
      Time.current.strftime("%Y-%m-%d %H:%M")
    end
  
    def self.list_all
      where(status: true).where("date_publish <= ?", time_now).order("date_publish desc")
    end
  
    def self.list_by_category(category)
      id ||= ContentBuilderCategory.find_by_slug(category)
      where(status: true, content_builder_category_id: id)
      .where("date_publish <= ?", time_now).order("date_publish desc")
    end
  
    def self.time_now
      Time.current.strftime("%Y-%m-%d %H:%M")
    end
  
    def publish_date
      dt = self.date_publish
      month = I18n.t("date.month_names")[dt.mon]
      day = dt.mday.to_s
      year = dt.year.to_s
      day << " de " << month << " de " << year
    end
end
  