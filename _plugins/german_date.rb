module Jekyll
  module GermanDateFilter
    MONTHS = {
      1 => "Januar", 2 => "Februar", 3 => "März", 4 => "April",
      5 => "Mai", 6 => "Juni", 7 => "Juli", 8 => "August",
      9 => "September", 10 => "Oktober", 11 => "November", 12 => "Dezember"
    }.freeze

    def german_date(date, format)
      date = Liquid::Utils.to_date(date)
      format.gsub("%B", MONTHS[date.month]).then { |f| date.strftime(f) }
    end
  end
end

Liquid::Template.register_filter(Jekyll::GermanDateFilter)
