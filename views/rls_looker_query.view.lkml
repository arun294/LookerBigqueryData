view: rls_looker_query {
    derived_table: {
    sql: SELECT c.customer_name, c.customer_id
      FROM `vbi-training.GCP_Looker_Training.customers` c
      JOIN `vbi-training.GCP_Looker_Training.user_groups` g
        ON SESSION_USER() = g.user
      WHERE c.country IN (
        CASE
          WHEN g.group='analysts_br' THEN 'Br'
          WHEN g.group='analysts_ca' THEN 'Ca'
          WHEN g.group='analysts_us' THEN 'US'
        END
      )
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  set: detail {
    fields: [customer_name, customer_id]
  }
}
