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

  def get_format_str(size)
    "%#{size.to_s.size}d"
  end
end
