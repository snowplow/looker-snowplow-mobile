view: mobile_sessions {
  label: "Mobile Sessions"
  sql_table_name: @{schema}.@{mobile_sessions_table} ;;
  drill_fields: [session_id]


# Session
  dimension: session_id {
    label: "session_id"
    primary_key: yes
    description: "A visit / session UUID"
    group_label: "Session"
    type: string
    sql: ${TABLE}.session_id ;;
  }

   dimension: first_session_or_returning_session {
    label: "first_session_or_returning_session"
    type: string
    case: {
      when: {
        sql: ${session_index}=1 ;;
        label: "First Session"
      }
      when: {
        sql: ${session_index}>1 ;;
        label: "Returning Session"
      }
      else: "Error"
    }
    group_label: "Session"
  }

  dimension: session_period {
    label: "session_period"
    case: {
      when: {
        sql: ${start_tstamp_time} >= DATEADD(day, -28, GETDATE()) ;;
        label: "30 days period"
      }
      when: {
        sql: ${start_tstamp_time} >= DATEADD(day, -56, GETDATE()) AND ${start_tstamp_time} < DATEADD(day, -28, GETDATE()) ;;
        label: "60 days period"
      }
      else: "Past 60 days"
    }
    group_label: "Session"
  }

  dimension: user_engaged {
    label: "user_engaged"
    type: yesno
    description: "If the user engaged for a certain amount of time and screen views"
    sql: ${session_duration_s} >= 60 AND ${screen_views} >= 3 ;;
    group_label: "Engaged Time"
  }

# Engaged Time

  dimension_group: end_tstamp {
    label: "end_tstamp"
    description: "Timestamp for the last time the session was active, based on derived_tstamp"
    group_label: "Engaged Time"
    group_item_label: "{% assign timeframe = _field._name | replace: \"_\" , \" \" | capitalize %} {{ timeframe }}"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_tstamp ;;
  }

  dimension: session_duration_s {
    label: "session_duration_in_s"
    description: "The total session duration in seconds"
    group_label: "Engaged Time"
    type: number
    sql: ${TABLE}.session_duration_s ;;
  }

# Device

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

# Application

  dimension: first_build {
    label: "first_build"
    description: "The first build of the application"
    group_label: "Application"
    type: string
    sql: ${TABLE}.first_build ;;
  }

  dimension: last_build {
    label: "last_build"
    description: "The last build of the application"
    group_label: "Application"
    type: string
    sql: ${TABLE}.last_build ;;
  }

  dimension: first_version {
    label: "user_ipaddress"
    description: "The first version of the application"
    group_label: "Application"
    type: string
    sql: ${TABLE}.first_version ;;
  }

  dimension: last_version {
    label: "last_version"
    description: "The last version of the application"
    group_label: "Application"
    type: string
    sql: ${TABLE}.last_version ;;
  }

  dimension: has_install {
    label: "has_install"
    description: "Whether the application is installed or not"
    group_label: "Application"
    type: yesno
    sql: ${TABLE}.has_install ;;
  }

# App ID
  dimension: app_id {
    label: "app_id"
    description: "Application ID e.g. ‘angry-birds’ is used to distinguish different applications that are being tracked by the same Snowplow stack, e.g. production versus dev."
    group_label: "App ID"
    type: string
    sql: ${TABLE}.app_id ;;
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

# First Screen

  dimension: first_screen_view_name {
    label: "first_screen_view_name"
    description: "The name of the first screen viewed in the session"
    group_label: "First Screen"
    type: string
    sql: ${TABLE}.first_screen_view_name ;;
  }

  dimension: first_screen_view_transition_type {
    label: "first_screen_view_transition_type"
    description: "The type of transition for the first screen view in the session"
    group_label: "First Screen"
    type: string
    sql: ${TABLE}.first_screen_view_transition_type ;;
  }

  dimension: first_screen_view_type {
    label: "first_screen_view_type"
    description: "The type of the first screen view in the session"
    group_label: "First Screen"
    type: string
    sql: ${TABLE}.first_screen_view_type ;;
  }

# Last Screen

  dimension: last_screen_view_name {
    label: "last_screen_view_name"
    description: "The name of the last screen viewed in the session"
    group_label: "Last Screen"
    type: string
    sql: ${TABLE}.last_screen_view_name ;;
  }

  dimension: last_screen_view_type {
    label: "last_screen_view_type"
    description: "The type of the last screen viewed in the session"
    group_label: "Last Screen"
    type: string
    sql: ${TABLE}.last_screen_view_type ;;
  }

  dimension: last_screen_view_transition_type {
    label: "last_screen_view_transition_type"
    description: "The transition type of the last screen viewed in the session"
    group_label: "Last Screen"
    type: string
    sql: ${TABLE}.last_screen_view_transition_type ;;
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

  dimension: geo_location {
    label: "geo_location"
    description: "Location of User"
    group_label: "Geography"
    type: location
    sql_latitude: ${geo_latitude} ;;
    sql_longitude: ${geo_longitude} ;;
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

# Tracker

  dimension: name_tracker {
    label: "tracker_name"
    description: "The namespace of the tracker used"
    group_label: "Tracker"
    type: string
    sql: ${TABLE}.name_tracker ;;
  }

  dimension: v_tracker {
    label: "tracker_version"
    description: "The version of the tracker used"
    group_label: "Tracker"
    type: string
    sql: ${TABLE}.v_tracker ;;
  }

# Sessions

  dimension: session_index {
    label: "session_index"
    description: "The visit/session index"
    group_label: "Sessions"
    type: number
    sql: ${TABLE}.session_index ;;
  }

  dimension_group: start_tstamp {
    label: "start_tstamp"
    description: "Timestamp for the start of the sessions lifecycle, based on derived_tstamp"
    group_label: "Sessions"
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
    sql: ${TABLE}.start_tstamp ;;
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

  dimension: first_event_name {
    label: "first_event_name"
    description: "The name of the first event of the session"
    group_label: "Sessions"
    type: string
    sql: ${TABLE}.first_event_name ;;
  }

  dimension: session_last_event_id {
    label: "session_last_event_id"
    description: "The event id of the last event in the session"
    group_label: "Sessions"
    type: string
    sql: ${TABLE}.session_last_event_id ;;
  }

  dimension: last_event_name {
    label: "last_event_name"
    description: "The name of the last event of the session"
    group_label: "Sessions"
    type: string
    sql: ${TABLE}.last_event_name ;;
  }

  dimension: screen_views {
    label: "screen_views"
    description: "The total screen views in the session"
    group_label: "Sessions"
    type: number
    sql: ${TABLE}.screen_views ;;
  }

  dimension: screen_names_viewed {
    label: "screen_names_viewed"
    description: "The number of different screens viewed where the unique screens are counted by the screen names"
    group_label: "Sessions"
    type: number
    sql: ${TABLE}.screen_names_viewed ;;
  }

# Measures

  measure: Count {
    type: count
    hidden: yes
    drill_fields: [count*]
  }
  set: count {
    fields: [
      session_id,
      start_tstamp_time,
      end_tstamp_time,
      screen_views
    ]
  }

  measure: Count_User {
    type: count
    hidden: yes
    drill_fields: [count_user*]
  }
  set: count_user {
    fields: [
      session_id,
      screen_views,
      geo_country,
      geo_timezone,
      first_screen_view_name,
      session_index
    ]
  }

  dimension: user_bounced {
    label: "user_bounced"
    type: yesno
    description: "User stopped the activity and left the page"
    sql: ${screen_views} =1 and ${session_duration_s} = 0 ;;
    group_label: "User"
  }

  dimension: new_user {
    label: "new_user"
    type: yesno
    group_label: "User"
    description: "New User interacting for the first time"
    sql: ${session_index} =1 ;;
  }


  dimension_group: session_minutes {
    label: "session_minutes"
    type: duration
    group_label: "Session"
    description: "Minutes per session by user"
    sql_start: ${start_tstamp_raw} ;;
    sql_end: ${end_tstamp_raw} ;;
    intervals: [minute]
  }

  dimension: first_session {
    label: "first_session"
    type: yesno
    group_label: "Session"
    description: "whether the session is first session or not"
    sql: ${session_index} = 1 ;;
    }

  measure: session_count {
    label: "session_count"
    type: count_distinct
    description: "Total number of sessions"
    group_label: "Count"
    sql: ${session_id} ;;
    drill_fields: [count*]
  }

  measure: user_count {
    label: "user_count"
    type: count_distinct
    description: "Total Number of Users"
    group_label: "Count"
    sql: ${device_user_id} ;;
    drill_fields: [count_user*]
  }

  measure: session_per_user {
    label: "session_per_user"
    type: number
    description: "average session per user"
    group_label: "Count"
    sql: ${session_count}/${user_count} ;;
    value_format_name: decimal_2
  }

}
