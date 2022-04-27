- dashboard: monthly_mobile_stats
  title: Monthly Mobile Stats
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Session Bounced Comparison - Monthly
    name: Session Bounced Comparison - Monthly
    model: "@{model_name}"
    explore: mobile_sessions
    type: looker_pie
    fields: [mobile_sessions.session_count, mobile_sessions.user_bounced]
    fill_fields: [mobile_sessions.user_bounced]
    filters:
      mobile_sessions.start_tstamp_month: 1 months
    sorts: [mobile_sessions.session_count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5
      palette_id: 0c5264fb-0681-4817-b9a5-d3c81002ce4c
      options:
        steps: 5
    series_colors: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Daily Session by New Visitors -Monthly
    name: Daily Session by New Visitors -Monthly
    model: "@{model_name}"
    explore: mobile_sessions
    type: looker_area
    fields: [mobile_sessions.start_tstamp_date, mobile_sessions.session_count, mobile_sessions.first_session]
    pivots: [mobile_sessions.first_session]
    fill_fields: [mobile_sessions.start_tstamp_date, mobile_sessions.first_session]
    filters:
      mobile_sessions.start_tstamp_month: 1 months
    sorts: [mobile_sessions.start_tstamp_date desc, mobile_sessions.first_session]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    defaults_version: 1
    row: 24
    col: 0
    width: 24
    height: 11
  - title: Engaged User Count - Monthly
    name: Engaged User Count - Monthly
    model: "@{model_name}"
    explore: screen_views
    type: looker_pie
    fields: [screen_views.user_count, screen_views.user_engaged]
    fill_fields: [screen_views.user_engaged]
    filters:
      screen_views.derived_tstamp_month: 1 months
    sorts: [screen_views.user_count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    row: 6
    col: 0
    width: 8
    height: 6
  - title: First/Returning Session - Monthly
    name: First/Returning Session - Monthly
    model: "@{model_name}"
    explore: mobile_sessions
    type: looker_pie
    fields: [mobile_sessions.session_count, mobile_sessions.first_session_or_returning_session]
    fill_fields: [mobile_sessions.first_session_or_returning_session]
    filters:
      mobile_sessions.start_tstamp_month: 1 months
    sorts: [mobile_sessions.session_count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    row: 6
    col: 8
    width: 8
    height: 6
  - title: New User Count - Monthly
    name: New User Count - Monthly
    model: "@{model_name}"
    explore: screen_views
    type: looker_column
    fields: [screen_views.derived_tstamp_date, screen_views.new_user_count]
    fill_fields: [screen_views.derived_tstamp_date]
    filters:
      screen_views.derived_tstamp_month: 1 months
    sorts: [screen_views.derived_tstamp_date desc]
    limit: 500
    query_timezone: Australia/Melbourne
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: snowplow
      palette_id: snowplow-categorical-0
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    row: 35
    col: 0
    width: 24
    height: 8
  - title: New vs Old Users Sessions - Monthly
    name: New vs Old Users Sessions - Monthly
    model: "@{model_name}"
    explore: mobile_sessions
    type: looker_pie
    fields: [mobile_sessions.session_count, mobile_sessions.new_user]
    fill_fields: [mobile_sessions.new_user]
    filters:
      mobile_sessions.start_tstamp_month: 1 months
    sorts: [mobile_sessions.session_count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    series_colors: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    row: 6
    col: 16
    width: 8
    height: 6
  - title: New/Old User - Monthly
    name: New/Old User - Monthly
    model: "@{model_name}"
    explore: screen_views
    type: looker_grid
    fields: [screen_views.new_user_count, screen_views.returned_user_count]
    filters:
      screen_views.derived_tstamp_month: 1 months
    sorts: [screen_views.new_user_count desc]
    limit: 50
    query_timezone: Australia/Melbourne
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: snowplow
      palette_id: snowplow-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    row: 12
    col: 0
    width: 8
    height: 6
  - title: New Vs Returned Users - Monthly
    name: New Vs Returned Users - Monthly
    model: "@{model_name}"
    explore: screen_views
    type: looker_column
    fields: [screen_views.derived_tstamp_date, screen_views.new_user_count, screen_views.returned_user_count]
    fill_fields: [screen_views.derived_tstamp_date]
    filters:
      screen_views.derived_tstamp_month: 1 months
    sorts: [screen_views.derived_tstamp_date desc]
    limit: 500
    query_timezone: Australia/Melbourne
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: snowplow
      palette_id: snowplow-categorical-0
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    row: 43
    col: 0
    width: 24
    height: 8
  - title: Session Bounced - Monthly
    name: Session Bounced - Monthly
    model: "@{model_name}"
    explore: mobile_sessions
    type: looker_area
    fields: [mobile_sessions.user_bounced, mobile_sessions.session_count, mobile_sessions.start_tstamp_date]
    pivots: [mobile_sessions.user_bounced]
    fill_fields: [mobile_sessions.user_bounced, mobile_sessions.start_tstamp_date]
    filters:
      mobile_sessions.start_tstamp_month: 1 months
    sorts: [mobile_sessions.user_bounced, mobile_sessions.start_tstamp_date desc]
    query_timezone: Australia/Melbourne
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: snowplow
      palette_id: snowplow-categorical-0
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    defaults_version: 1
    ordering: none
    show_null_labels: false
    row: 51
    col: 0
    width: 24
    height: 9
  - title: Total Session - Monthly
    name: Total Session - Monthly
    model: "@{model_name}"
    explore: screen_views
    type: single_value
    fields: [mobile_sessions.session_count]
    filters:
      mobile_sessions.start_tstamp_month: 1 months
    limit: 500
    query_timezone: Australia/Melbourne
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    series_types: {}
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Total User - Monthly
    name: Total User - Monthly
    model: "@{model_name}"
    explore: screen_views
    type: looker_geo_coordinates
    fields: [mobile_sessions.geo_location, mobile_sessions.user_count]
    filters:
      mobile_sessions.start_tstamp_month: 1 months
    sorts: [mobile_sessions.user_count desc]
    column_limit: 50
    map: world
    map_projection: ''
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    quantize_colors: false
    row: 60
    col: 0
    width: 24
    height: 14
  - title: Total User Numbers - Monthly
    name: Total User Numbers - Monthly
    model: "@{model_name}"
    explore: screen_views
    type: single_value
    fields: [mobile_users.user_count]
    filters:
      screen_views.derived_tstamp_month: 1 months
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    series_types: {}
    row: 0
    col: 16
    width: 8
    height: 6
 