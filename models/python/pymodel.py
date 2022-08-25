def model(dbt, session):

    dbt.config(materialized="table")
  
    my_sql_model_df = dbt.ref("my_first_dbt_model")
    
    final_df = my_sql_model_df
    
    return final_df