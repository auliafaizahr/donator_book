if Rails.env.production?
  wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf"
else
  wkhtmltopdf_path = "/home/auliafaizahr/.rvm/gems/ruby-2.6.3/bin/wkhtmltopdf"
end

WickedPdf.config = {
  exe_path: wkhtmltopdf_path,
  wkhtmltopdf: wkhtmltopdf_path,
  enable_local_file_access: true,
  page_height: 110,
  page_width: 110,
  disable_smart_shrinking:        true,
  background: true,
  no_background: false,
  image: true
  # Using wkhtmltopdf without an X server can be achieved by enabling the
  # 'use_xvfb' flag. This will wrap all wkhtmltopdf commands around the
  # 'xvfb-run' command, in order to simulate an X server.
  #
  # use_xvfb: true,
}
