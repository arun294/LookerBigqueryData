view: wildcard_query {
  derived_table: {
    sql: select *
      FROM
        `vbi-training.GCP_Looker_Training.Time*`
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
