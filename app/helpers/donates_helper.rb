module DonatesHelper

  def download_image(url)
    return 'data:image/png;base64,' + Base64.encode64(open(url) { |io| io.read })
  end

  def generate_html_template(image_url)

    "<!DOCTYPE html>
    <html>
        <head>
        </head>
        <body>
        ... some html template
        <img src='#{image_url}'/>
        </body>
    </html>
    "
  end
end
