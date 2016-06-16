event_data = { summary: "this is a summary", location: "4335 E 3rd Ave, Denver, CO 80220",
               description: "this is a description", start_time: (Date.today.to_datetime - 1 + 14.hour),
               end_time: (Date.today.to_datetime - 1 + 15.hour), email: "jenn@trelora.com"}
  GoogleCalendarService.new.create_event(event_data)

# antonio@trelora.com 8
# karen@trelora.com 12
# jenn@trelora.com 14
# tanner@trelora.com 57

# 4720-4730 S Hawthorne St, Englewood, CO 80110
# 4335 E 3rd Ave, Denver, CO 80220
# 5238 E Cedar Ave, Denver, CO 80246
# 11730-11768 E Jewell Ave, Aurora, CO 80014
# 10900 E Briarwood Ave Centennial, CO 80111
# "https://mytrelora-production.s3.amazonaws.com/members/avatar/8/small_Anton_20_2_.png"
# "https://mytrelora-production.s3.amazonaws.com/members/avatar/12/small_Karen_J_B_3AW.png"
# "https://mytrelora-production.s3.amazonaws.com/members/avatar/14/small_Jenn.png"
# "https://mytrelora-production.s3.amazonaws.com/members/avatar/57/small_Tanner.png"
