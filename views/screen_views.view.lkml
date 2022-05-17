view: screen_views {
  label: "Screen Views"
  sql_table_name: @{schema}.@{screen_views_table} ;;
  drill_fields: [screen_view_id]


# Screen View
  dimension: screen_view_id {
    label: "screen_view_id"
    primary_key: yes
    description: "A UUID for each screen view e.g. ‘c6ef3124-b53a-4b13-a233-0088f79dcbcb’"
    group_label: "Screen View"
    type: string
    sql: ${TABLE}.screen_view_id ;;
  }

# App ID
  dimension: app_id {
    label: "app_id"
    description: "Application ID e.g. ‘angry-birds’ is used to distinguish different applications that are being tracked by the same Snowplow stack, e.g. production versus dev."
    group_label: "App ID"
    type: string
    sql: ${TABLE}.app_id ;;
  }

  dimension: build {
    label: "build"
    description: "The build of the application"
    group_label: "App ID"
    type: string
    sql: ${TABLE}.build ;;
  }

  dimension: version {
    label: "version"
    description: "The version of the application"
    group_label: "App ID"
    type: string
    sql: ${TABLE}.version ;;
  }

# User

  dimension: device_user_id {
    label: "device_user_id"
    group_label: "User"
    description: "User ID set by the device"
    type: string
    sql: ${TABLE}.device_user_id ;;
  }


  dimension: network_userid {
    label: "network_userid"
    group_label: "User"
    description: "User ID set by Snowplow using 3rd party cookie e.g. ‘ecdff4d0-9175-40ac-a8bb-325c49733607’"
    type: string
    sql: ${TABLE}.network_userid ;;
  }

  dimension: user_id {
    label: "user_id"
    description: "Unique ID set by business e.g. ‘jon.doe@email.com’"
    group_label: "User"
    type: string
    #hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_engaged {
    label: "user_engaged"
    type: yesno
    description: "If the user engaged for a certain amount of time and screen views"
    group_label: "User"
    sql: ${mobile_sessions.user_engaged} ;;
  }

# Timestamp
  dimension_group: collector_tstamp {
    label: "collector_tstamp"
    description: "Timestamp for the event recorded by the collector e.g. ‘2013-11-26 00:02:05’"
    group_label: "Timestamp"
    type: time
    group_item_label: "{% assign timeframe = _field._name | replace: \"_\" , \" \" | capitalize %} {{ timeframe }}"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.collector_tstamp ;;
  }

  dimension_group: derived_tstamp {
    label: "derived_tstamp"
    description: "Timestamp making allowance for innaccurate device clock e.g. ‘2013-11-26 00:02:04’"
    group_label: "Timestamp"
    type: time
    group_item_label: "{% assign timeframe = _field._name | replace: \"_\" , \" \" | capitalize %} {{ timeframe }}"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.derived_tstamp ;;
  }

# Device

  dimension_group: dvce_created_tstamp {
    label: "device_created_tstamp"
    description: "Timestamp for when the device was created"
    group_label: "Device"
    type: time
    group_item_label: "{% assign timeframe = _field._name | replace: \"_\" , \" \" | capitalize %} {{ timeframe }}"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dvce_created_tstamp ;;
  }

  dimension: dvce_screenwidth {
    label: "device_screenwidth"
    description: "The screen width of the device in pixels"
    group_label: "Device"
    type: number
    sql: ${TABLE}.dvce_screenwidth ;;
  }

  dimension: dvce_screenheight {
    label: "device_screenheight"
    description: "The screen height of the device in pixels"
    group_label: "Device"
    type: number
    sql: ${TABLE}.dvce_screenheight ;;
  }

  dimension: device_manufacturer {
    label: "device_manufacturer"
    description: "The manufacturer of the device"
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_manufacturer ;;
  }

  dimension: device_model {
    label: "device_model"
    description: "The model of the device"
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_model ;;
  }

  dimension: os_type {
    label: "operating_system_type"
    description: "The type of operating system running on the device"
    group_label: "Device"
    type: string
    sql: ${TABLE}.os_type ;;
  }

  dimension: os_version {
    label: "operating_system_version"
    description: "The full version of the operating system of the device"
    group_label: "Device"
    type: string
    sql: ${TABLE}.os_version ;;
  }


  dimension: android_idfa {
    label: "android_idfa"
    description: "The identifier for advertisers for Android devices"
    group_label: "Device"
    type: string
    sql: ${TABLE}.android_idfa ;;
  }

  dimension: apple_idfa {
    label: "apple_idfa"
    description: "The identifier for advertisers for Apple devices"
    group_label: "Device"
    type: string
    sql: ${TABLE}.apple_idfa ;;
  }

  dimension: apple_idfv {
    label: "apple_idfv"
    description: "The identifier for vendors for Apple devices"
    group_label: "Device"
    type: string
    sql: ${TABLE}.apple_idfv ;;
  }

  dimension: open_idfa {
    label: "open_idfa"
    description: "The identifier for vendors for open devices"
    group_label: "Device"
    type: string
    sql: ${TABLE}.open_idfa ;;
  }

  dimension: carrier {
    label: "carrier"
    description: "The carrier for the mobile device the session was using"
    group_label: "Device"
    type: string
    sql: ${TABLE}.carrier ;;
  }

  dimension: network_technology {
    label: "network_technology"
    description: "The technlogy used by the network provider of the device"
    group_label: "Device"
    type: string
    sql: ${TABLE}.network_technology ;;
  }

  dimension: network_type {
    label: "network_type"
    description: "The type of network active on the device, e.g. 3G"
    group_label: "Device"
    type: string
    sql: ${TABLE}.network_type ;;
  }

  dimension: user_ipaddress {
    label: "user_ipaddress"
    description: "The IP address of the device when accessing the application"
    group_label: "Device"
    type: string
    sql: ${TABLE}.user_ipaddress ;;
  }

  dimension: useragent {
    label: "useragent"
    description: "The raw useragent"
    group_label: "Device"
    type: string
    sql: ${TABLE}.useragent ;;
  }

  dimension: device_latitude {
    label: "device_latitude"
    description: "The latitude coordinates for the device location"
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_latitude ;;
  }

  dimension: device_longitude {
    label: "device_longitude"
    description: "The longitude coordinates for the device location"
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_longitude ;;
  }

  dimension: device_latitude_longitude_accuracy {
    label: "device_latitude_longitude_accuracy"
    description: "The accuracy of the latitude and longitude coordinates for the device location"
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_latitude_longitude_accuracy ;;
  }

  dimension: device_altitude {
    label: "device_altitude"
    description: "The altitude coordinates for the device"
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_altitude ;;
  }

  dimension: device_altitude_accuracy {
    label: "device_altitude_accuracy"
    description: "The accuracy of the device altitude coordinates"
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_altitude_accuracy ;;
  }

  dimension: device_bearing {
    label: "device_bearing"
    description: "The horizontal angle between the device and true north"
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_bearing ;;
  }

  dimension: device_speed {
    label: "device_speed"
    description: "The speed of the device"
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_speed ;;
  }

# Event
  dimension: event_id {
    label: "event_id"
    description: "A UUID for each event e.g. ‘c6ef3124-b53a-4b13-a233-0088f79dcbcb’"
    group_label: "Event"
    type: string
    sql: ${TABLE}.event_id ;;
  }

# Geography

  dimension: geo_country {
    label: "geo_country"
    description: "The ISO 3166-1 code for the country the session is located in"
    group_label: "Geography"
    type: string
    sql: ${TABLE}.geo_country ;;
  }

  dimension: geo_region {
    label: "geo_region"
    description: "The ISO-3166-2 code for the country region of the location the session was in"
    group_label: "Geography"
    type: string
    sql: ${TABLE}.geo_region ;;
  }

  dimension: geo_city {
    label: "geo_city"
    description: "The city of the location the session was in"
    group_label: "Geography"
    type: string
    sql: ${TABLE}.geo_city ;;
  }

  dimension: geo_zipcode {
    label: "geo_zipcode"
    description: "The zipcode of the location the session was in"
    group_label: "Geography"
    type: string
    sql: ${TABLE}.geo_zipcode ;;
  }

  dimension: geo_latitude {
    label: "geo_latitude"
    description: "The latitude of the location the session was in"
    group_label: "Geography"
    type: number
    sql: ${TABLE}.geo_latitude ;;
  }

  dimension: geo_longitude {
    label: "geo_longitude"
    description: "The longitude of the location the session was in"
    group_label: "Geography"
    type: number
    sql: ${TABLE}.geo_longitude ;;
  }

  dimension: geo_region_name {
    label: "geo_region_name"
    description: "The region name of the location the session was in"
    group_label: "Geography"
    type: string
    sql: ${TABLE}.geo_region_name ;;
  }

  dimension: geo_timezone {
    label: "geo_timezone"
    description: "The timezone of the session's device"
    group_label: "Geography"
    type: string
    sql: ${TABLE}.geo_timezone ;;
  }

  # App Errors

  dimension: app_errors {
    label: "app_errors"
    description: "The total number of app errors that were triggered for the session"
    group_label: "App Errors"
    type: number
    sql: ${TABLE}.app_errors ;;
  }

  dimension: fatal_app_errors {
    label: "fatal_app_errors"
    description: "The total number of fatal app errors that were triggered for the session"
    group_label: "App Errors"
    type: number
    sql: ${TABLE}.fatal_app_errors ;;
  }

# Screen View
  dimension: screen_view_name {
    label: "screen_view_name"
    description: "The name of the screen viewed"
    group_label: "Screen View"
    type: string
    sql: ${TABLE}.screen_view_name ;;
  }

  dimension: screen_view_transition_type {
    label: "screen_view_transition_type"
    description: "The type of transition that led to the screen being viewed"
    group_label: "Screen View"
    type: string
    sql: ${TABLE}.screen_view_transition_type ;;
  }

  dimension: screen_view_type {
    label: "screen_view_type"
    description: "The type of screen that was viewed"
    group_label: "Screen View"
    type: string
    sql: ${TABLE}.screen_view_type ;;
  }

  dimension: screen_fragment {
    label: "screen_view_type"
    description: "The name of the screen fragment (also known as the anchor)"
    group_label: "Screen View"
    type: string
    sql: ${TABLE}.screen_view_type ;;
  }

  dimension: screen_top_view_controller {
    label: "screen_top_view_controller"
    description: "The name of the root view controller"
    group_label: "Screen View"
    type: string
    sql: ${TABLE}.screen_top_view_controller ;;
  }

  dimension: screen_view_controller {
    label: "screen_view_controller"
    description: "The name of the view controller"
    group_label: "Screen View"
    type: string
    sql: ${TABLE}.screen_view_controller ;;
  }

  dimension: screen_view_previous_id {
    label: "screen_view_previous_id"
    description: "The UUID of the previous screen view"
    group_label: "Screen View"
    type: string
    sql: ${TABLE}.screen_view_previous_id ;;
  }

  dimension: screen_view_previous_name {
    label: "screen_view_previous_name"
    description: "The name of the previous screen view"
    group_label: "Screen View"
    type: string
    sql: ${TABLE}.screen_view_previous_name ;;
  }

  dimension: screen_view_previous_type {
    label: "screen_view_previous_type"
    description: "The type of the previous screen view"
    group_label: "Screen View"
    type: string
    sql: ${TABLE}.screen_view_previous_type ;;
  }

# Sessions

  dimension: session_id {
    label: "session_id"
    description: "A visit / session UUID"
    group_label: "Session"
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: previous_session_id {
    label: "previous_session_id"
    description: "The session id of the previous session before this one"
    group_label: "Sessions"
    type: string
    sql: ${TABLE}.previous_session_id ;;
  }

  dimension: session_first_event_id {
    label: "session_first_event_id"
    description: "The event id of the first event in the session"
    group_label: "Sessions"
    type: string
    sql: ${TABLE}.session_first_event_id ;;
  }

  dimension: session_index {
    label: "session_index"
    description: "The visit/session index"
    group_label: "Sessions"
    type: number
    sql: ${TABLE}.session_index ;;
  }

  dimension: screen_view_in_session_index {
    label: "screen_view_in_session_index"
    description: "The index of the screen view within the session. This is generated by the tracker"
    group_label: "Sessions"
    type: number
    sql: ${TABLE}.screen_view_in_session_index ;;
  }

  dimension: screen_views_in_session {
    label: "screen_views_in_session"
    description: "The total number of screen views within a session"
    group_label: "Sessions"
    type: number
    sql: ${TABLE}.screen_views_in_session ;;
  }

#Measures

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }
   # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      screen_view_id,
      geo_region_name,
      mobile_users.device_user_id,
      mobile_users.network_userid,
    ]
  }

  measure: user_details {
    type: count
    drill_fields: [user_details*]
    hidden: yes
  }
  set: user_details {
    fields: [
      device_user_id,
      geo_country,
      user_ipaddress,
      geo_timezone,
      geo_city
    ]
  }

  measure: session_count {
    label: "session_count"
    type: number
    description: "Total Number of Sessions"
    sql: ${mobile_sessions.session_count} ;;
    group_label: "Count"
    drill_fields: [session_count*]
  }
  set: session_count {
    fields: [
      session_id,
      screen_views_in_session
    ]
  }

  measure: user_count {
    label: "user_count"
    type: number
    description: "Total number of Users"
    sql: ${mobile_sessions.user_count} ;;
    group_label: "Count"
    drill_fields: [user_details*]
  }

  measure: new_user_count {
    label: "new_user_count"
    type: count_distinct
    description: "total number of new users"
    group_label: "Count"
    sql: ${device_user_id} ;;
    filters: [
      session_index: "1"
    ]
    drill_fields: [user_details*]
  }

  measure: returned_user_count {
    label: "returned_user_count"
    type: count_distinct
    description: "total number of returned users"
    group_label: "Count"
    sql: ${device_user_id} ;;
    filters: [
      session_index: ">1"
    ]
    drill_fields: [user_details*]
  }

  measure: total_screen_views {
    label: "total_screen_views"
    group_label: "Count"
    description: "total number of distinct screen views"
    type: count_distinct
    sql: ${screen_view_id} ;;
  }

}
