module CodesHelper
  def expired_at
    diff = (@code.expired_at - Time.now)
    if diff < 5.minute
      'badge badge-danger'
    elsif 1.hour > diff && diff > 5.minute
      'badge badge-warning'
    else
      'badge badge-success'
    end
  end

  def format_code(code, lang)
    CodeRay.scan(code, lang).div(line_numbers: :table, css: :style).html_safe
  end
end
