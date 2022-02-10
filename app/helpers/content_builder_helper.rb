module ContentBuilderHelper
    def most_read_of_the_week
        date = Date.today

        count_read = ContentBuilderCountRead.select("content_builder_id, count(*) as total_count")
        .where(created_at: date.beginning_of_week(start_day = :sunday)..date.end_of_week(start_day = :sunday))
        .group('content_builder_id').order("total_count desc").limit(5)

        count_read.present? ? count_read : ContentBuilder.last(5)
    end
end