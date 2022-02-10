module ClimaTempoHelper
    def data_clima_tempo(cod)
      source = "https://api.hgbrasil.com/weather/?format=json&woeid=#{cod}"
      request = Typhoeus::Request.new(source)
      resp = request.run
      if resp.code == 200
        data = resp.body
        result = JSON.parse(data)
        return result["results"]
      else
        return {
          "temp" => 99,
          "date" => Time.now.strftime("%d/%m/%Y"),
          "time" => Time.now.strftime("%H:%M"),
          "condition_code" => "30",
          "description" => "Indisponível",
          "currently" => "Indisponível",
          "cid" => "",
          "city" => "Nova Andradina,",
          "img_id" => "30",
          "humidity" => "00",
          "wind_speedy" => "00.00 km/h",
          "sunrise" => "00:00 am",
          "sunset" => "00:00 am",
          "condition_slug" => "cloudly_day",
          "city_name" => "Indisponível",
          "forecast" => [
            {
              "date" => Time.now.strftime("%d/%m"),
              "weekday" => "Indisponível",
              "max" => "00",
              "min" => "00",
              "description" => "Indisponível",
              "condition" => "cloudly_day"
            },
            {
              "date" => (Time.now + 1.day).strftime("%d/%m"),
              "weekday" => "Indisponível",
              "max" => "00",
              "min" => "00",
              "description" => "Indisponível",
              "condition" => "cloudly_day"
            },
            {
              "date" => (Time.now + 2.day).strftime("%d/%m"),
              "weekday" => "Indisponível",
              "max" => "00",
              "min" => "00",
              "description" => "Indisponível",
              "condition" => "cloudly_day"
            },
            {
              "date" => (Time.now + 3.day).strftime("%d/%m"),
              "weekday" => "Indisponível",
              "max" => "00",
              "min" => "00",
              "description" => "Indisponível",
              "condition" => "cloudly_day"
            },
            {
              "date" => (Time.now + 4.day).strftime("%d/%m"),
              "weekday" => "Indisponível",
              "max" => "00",
              "min" => "00",
              "description" => "Indisponível",
              "condition" => "cloudly_day"
            },
            {
              "date" => (Time.now + 5.day).strftime("%d/%m"),
              "weekday" => "Indisponível",
              "max" => "00",
              "min" => "00",
              "description" => "Indisponível",
              "condition" => "cloudly_day"
            },
            {
              "date" => (Time.now + 6.day).strftime("%d/%m"),
              "weekday" => "Indisponível",
              "max" => "00",
              "min" => "00",
              "description" => "Indisponível",
              "condition" => "cloudly_day"
            },
            {
              "date" => (Time.now + 7.day).strftime("%d/%m"),
              "weekday" => "Indisponível",
              "max" => "00",
              "min" => "00",
              "description" => "Indisponível",
              "condition" => "cloudly_day"
            },
            {
              "date" => (Time.now + 8.day).strftime("%d/%m"),
              "weekday" => "Indisponível",
              "max" => "00",
              "min" => "00",
              "description" => "Indisponível",
              "condition" => "cloudly_day"
            },
            {
              "date" => (Time.now + 9.day).strftime("%d/%m"),
              "weekday" => "Indisponível",
              "max" => "00",
              "min" => "00",
              "description" => "Indisponível",
              "condition" => "cloudly_day"
            }
          ]
        }
      end
    end
  end
  