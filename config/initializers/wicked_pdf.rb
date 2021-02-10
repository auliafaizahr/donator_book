WickedPdf.config = {
  if Rails.env.production?
    exe_path: "#{Rails.root}/bin/wkhtmltopdf"
  else
    exe_path = '/home/auliafaizahr/.rvm/gems/ruby-2.6.3/bin/wkhtmltopdf',
  end
  enable_local_file_access: true,
  page_height: 110,
  page_width: 110,
  disable_smart_shrinking:        true,
  background: true,
  no_background: false,
  image: true
  # Path to the wkhtmltopdf executable: This usually isn't needed if using
  # one of the wkhtmltopdf-binary family of gems.
  # exe_path: '/usr/local/bin/wkhtmltopdf',
  #   or
  # exe_path: Gem.bin_path('wkhtmltopdf-binary', 'wkhtmltopdf')

  # Layout file to be used for all PDFs
  # (but can be overridden in `render :pdf` calls)
  # layout: 'pdf.html',

  # Using wkhtmltopdf without an X server can be achieved by enabling the
  # 'use_xvfb' flag. This will wrap all wkhtmltopdf commands around the
  # 'xvfb-run' command, in order to simulate an X server.
  #
  # use_xvfb: true,
}
