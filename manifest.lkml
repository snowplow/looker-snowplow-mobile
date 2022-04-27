constant: connection {
  value: "string"
  export: override_required
}

constant: schema {
  value: "derived"
  export: override_optional
}

constant: screen_views_table {
  value: "mobile_screen_views"
  export: override_optional
}

constant: mobile_sessions_table {
  value: "mobile_sessions"
  export: override_optional
}

constant: mobile_users_table {
  value: "mobile_users"
  export: override_optional
}

constant: model_name {
  value: "snowplow_mobile_looker"
  export: override_optional
}
