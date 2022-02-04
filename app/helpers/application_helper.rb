module ApplicationHelper
    #Think this like an exthension method.
    def format_time(datetime)
        dt = datetime
        week_day = I18n.t("date.day_names")[dt.wday]
        month = I18n.t("date.month_names")[dt.mon]
        day = dt.mday.to_s
        year = dt.year.to_s
    
        "#{week_day}, #{day} de #{month} de #{year}"
    end
end