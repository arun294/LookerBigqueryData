view: unnest_query {
  derived_table: {
    sql: select id,first_name,last_name,dob,city from `vbi-training.GCP_Looker_Training.record-json` cross join unnest(addresses) as city where id='1'
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: dob {
    type: date
    datatype: date
    sql: ${TABLE}.dob ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  set: detail {
    fields: [id, first_name, last_name, dob, city]
  }
}
