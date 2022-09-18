module UsersHelper
  def user_report_frequencies
    User.report_frequencies.keys.map { |report_f| [report_f.titleize, report_f] }
  end
end
