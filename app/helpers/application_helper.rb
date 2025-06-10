module ApplicationHelper
  def google_maps_navigation_link(origin, destination, mobility_choice)
    web_link = "https://www.google.com/maps/dir/?api=1&origin=#{ERB::Util.url_encode(origin)}&destination=#{ERB::Util.url_encode(destination)}&travelmode=#{mobility_choice}&dir_action=navigate"
    android_link = "intent://maps.google.com/maps?daddr=#{ERB::Util.url_encode(destination)}&directionsmode=#{mobility_choice}#Intent;scheme=https;package=com.google.android.apps.maps;end;"
    ios_link = "comgooglemaps://?daddr=#{ERB::Util.url_encode(destination)}&directionsmode=#{mobility_choice}"

    {
      web: web_link,
      android: android_link,
      ios: ios_link
    }
  end
end

