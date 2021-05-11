view: ad_campaign_and_sales_wildcard_query {
  derived_table: {
    sql: SELECT *
      FROM
        `vbi-training.GCP_Looker_Training.Ad Campaign and Sales*`
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.Campaign_ID ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.Sales ;;
  }

  dimension: social_networks {
    type: number
    sql: ${TABLE}.Social_Networks ;;
  }

  dimension: online_media {
    type: number
    sql: ${TABLE}.Online_Media ;;
  }

  dimension: print_media {
    type: number
    sql: ${TABLE}.Print_Media ;;
  }

  set: detail {
    fields: [
      campaign_id,
      region,
      sales,
      social_networks,
      online_media,
      print_media
    ]
  }
}
