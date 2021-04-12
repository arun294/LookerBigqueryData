view: timetravel_query {
  derived_table: {
    sql: SELECT *
      FROM `GCP_Looker_Training.Timetravel`
        FOR SYSTEM_TIME AS OF TIMESTAMP_SUB(CURRENT_TIMESTAMP(),
       INTERVAL 1 HOUR)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  set: detail {
    fields: [product, quantity]
  }
}
