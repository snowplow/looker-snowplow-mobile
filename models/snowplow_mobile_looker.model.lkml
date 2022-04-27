
connection: "@{connection}"

label: "Snowplow Looker Mobile Model"

include: "../views/*.view"

datagroup: snowplow_looker_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: snowplow_looker_default_datagroup

explore: mobile_sessions {
  label: "Mobile Sessions"
  join: users {
    type: left_outer
    sql_on: ${mobile_sessions.device_user_id} = ${mobile_users.device_user_id} ;;
    relationship: many_to_one
  }
}

explore: screen_views {
  label: "Screen Views"
  join: sessions {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${screen_views.session_id} = ${mobile_sessions.session_id} ;;
  }
  join: mobile_users  {
    type:  left_outer
    relationship: many_to_one
    sql_on:  ${screen_views.device_user_id} = ${mobile_users.device_user_id} ;;
  }
}

explore: mobile_users  {
  label: "Mobile Users"
}
