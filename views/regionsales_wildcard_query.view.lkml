view: regionsales_wildcard_query {
  derived_table: {
    sql: select region,sales from `vbi-training.GCP_Looker_Training.Ad Campaign and Sales*`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  measure: sum(sales) {
    type: number
    sql: ${TABLE}.sales ;;
  }

  set: detail {
    fields: [region, sum(sales)]
  }
}
