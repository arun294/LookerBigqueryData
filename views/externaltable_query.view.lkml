view: externaltable_query {
  derived_table: {
    sql: SELECT * FROM `vbi-training.GCP_Looker_Training.external_table` LIMIT 1000
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: emp_num {
    type: number
    sql: ${TABLE}.emp_num ;;
  }

  dimension: emp_name {
    type: string
    sql: ${TABLE}.emp_name ;;
  }

  set: detail {
    fields: [emp_num, emp_name]
  }
}
