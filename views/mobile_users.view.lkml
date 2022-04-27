view: mobile_users {
  label: "Mobile Users"
  sql_table_name: @{schema}.@{mobile_users_table} ;;
  drill_fields: [device_user_id]


# User

  dimension: device_user_id {
    label: "device_user_id"
    primary_key: yes
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


# Engaged Time

  dimension_group: end_tstamp {
    label: "end_tstamp"
    description: "Timestamp for the last time the user was seen, based on derived_tstamp"
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
    description: "The total session duration in seconds by the user"
    group_label: "Engaged Time"
    type: number
    sql: ${TABLE}.session_duration_s ;;
  }


# First Screen

  dimension: first_screen_view_name {
    label: "first_screen_view_name"
    description: "The name of the first screen viewed by the user"
    group_label: "First Screen"
    type: string
    sql: ${TABLE}.first_screen_view_name ;;
  }

  dimension: first_screen_view_transition_type {
    label: "first_screen_view_transition_type"
    description: "The type of transition for the first screen view by the user"
    group_label: "First Screen"
    type: string
    sql: ${TABLE}.first_screen_view_transition_type ;;
  }

  dimension: first_screen_view_type {
    label: "first_screen_view_type"
    description: "The type of the first screen view by the user"
    group_label: "First Screen"
    type: string
    sql: ${TABLE}.first_screen_view_type ;;
  }


# Last Screen

  dimension: last_screen_view_name {
    label: "last_screen_view_name"
    description: "The name of the last screen viewed by the user"
    group_label: "Last Screen"
    type: string
    sql: ${TABLE}.last_screen_view_name ;;
  }

  dimension: last_screen_view_type {
    label: "last_screen_view_type"
    description: "The type of the last screen viewed by the user"
    group_label: "Last Screen"
    type: string
    sql: ${TABLE}.last_screen_view_type ;;
  }

  dimension: last_screen_view_transition_type {
    label: "last_screen_view_transition_type"
    description: "The transition type of the last screen viewed by the user"
    group_label: "Last Screen"
    type: string
    sql: ${TABLE}.last_screen_view_transition_type ;;
  }

# Screen Views

  dimension: screen_views {
    label: "screen_views"
    description: "The total screen views by the user"
    group_label: "Screen Views"
    type: number
    sql: ${TABLE}.screen_views ;;
  }

  dimension: screen_names_viewed {
    label: "screen_names_viewed"
    description: "The number of different screens viewed where the unique screens are counted by the screen names"
    group_label: "Screen Views"
    type: number
    sql: ${TABLE}.screen_names_viewed ;;
  }

# Sessions

  dimension: sessions {
    label: "sessions"
    description: "The total sessions by the user"
    group_label: "Sessions"
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension_group: start_tstamp {
    label: "start_tstamp"
    description: "Timestamp for the start of the users lifecycle, based on derived_tstamp"
    group_label: "Engaged Time"
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

  dimension: active_days {
    label: "active_days"
    description: "The total number of active days for the user"
    group_label: "Sessions"
    type: number
    sql: ${TABLE}.active_days ;;
  }

# App Errors

  dimension: app_errors {
    label: "app_errors"
    description: "The total number of app errors that were triggered for the user"
    group_label: "App Errors"
    type: number
    sql: ${TABLE}.app_errors ;;
  }

  dimension: fatal_app_errors {
    label: "fatal_app_errors"
    description: "The total number of fatal app errors that were triggered for the user"
    group_label: "App Errors"
    type: number
    sql: ${TABLE}.fatal_app_errors ;;
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

  dimension: first_os_type {
    label: "first_os_type"
    description: "The first type of operating system the user was using"
    group_label: "Device"
    type: string
    sql: ${TABLE}.first_os_type ;;
  }

  dimension: last_os_type {
    label: "last_os_type"
    description: "The last type of operating system the user was using"
    group_label: "Device"
    type: string
    sql: ${TABLE}.last_os_type ;;
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

  dimension: first_carrier {
    label: "first_carrier"
    description: "The first carrier for the mobile device the user was using"
    group_label: "Device"
    type: string
    sql: ${TABLE}.first_carrier ;;
  }

  dimension: last_carrier {
    label: "last_carrier"
    description: "The last carrier for the mobile device the user was using"
    group_label: "Device"
    type: string
    sql: ${TABLE}.last_carrier ;;
  }

# Geography

  dimension: geo_country {
    label: "geo_country"
    description: "The ISO 3166-1 code for the country the user is located in"
    group_label: "Geography"
    type: string
    sql: ${TABLE}.geo_country ;;
  }

  dimension: geo_region {
    label: "geo_region"
    description: "The ISO-3166-2 code for the country region of the location the user was in"
    group_label: "Geography"
    type: string
    sql: ${TABLE}.geo_region ;;
  }

  dimension: geo_city {
    label: "geo_city"
    description: "The city of the location the user was in"
    group_label: "Geography"
    type: string
    sql: ${TABLE}.geo_city ;;
  }

  dimension: geo_zipcode {
    label: "geo_zipcode"
    description: "The zipcode of the location the user was in"
    group_label: "Geography"
    type: string
    sql: ${TABLE}.geo_zipcode ;;
  }

  dimension: geo_latitude {
    label: "geo_latitude"
    description: "The latitude of the location the user was in"
    group_label: "Geography"
    type: number
    sql: ${TABLE}.geo_latitude ;;
  }

  dimension: geo_longitude {
    label: "geo_longitude"
    description: "The longitude of the location the user was in"
    group_label: "Geography"
    type: number
    sql: ${TABLE}.geo_longitude ;;
  }

  dimension: geo_region_name {
    label: "geo_region_name"
    description: "The region name of the location the user was in"
    group_label: "Geography"
    type: string
    sql: ${TABLE}.geo_region_name ;;
  }

  dimension: geo_timezone {
    label: "geo_timezone"
    description: "The timezone of the user's device"
    group_label: "Geography"
    type: string
    sql: ${TABLE}.geo_timezone ;;
  }

  measure: user_count {
    label: "user_count"
    type: count_distinct
    description: "Total Number of Users"
    group_label: "Count"
    sql: ${device_user_id} ;;
  }
}
