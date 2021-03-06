connection: "bigquery_training"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
datagroup: big_query_data_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}
explore: rls_looker_query {}
explore: unnest_query {}
explore: timetravel_query {}
explore: metadata_query {}
explore: externaltable_query {}
explore: wildcard_query {}
explore: ad_campaign_and_sales_wildcard_query {}
explore: rowlevel_europe {}

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.

# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
