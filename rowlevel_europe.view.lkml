view: rowlevel_europe {
  derived_table: {
    sql: SELECT c.Campaign_ID,c.Region,c.Sales,c.Social_Networks,c.Online_Media,c.Print_Media,
      FROM `vbi-training.GCP_Looker_Training.Ad Campaign and Sales` c
      JOIN `vbi-training.GCP_Looker_Training.Analysts_user_group` g
        ON SESSION_USER() = g.user
      WHERE c.Region IN (
        CASE
          WHEN g.group='analysts_Europe' THEN 'Europe'
          WHEN g.group='analysts_China'  THEN 'China'
          END
      )
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
