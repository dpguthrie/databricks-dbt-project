def model(dbt, session):

    dbt.config(
        materialized="table",
        submission_method="all_purpose_cluster",
        create_notebook=True,
        cluster_id="0830-163228-q22s4sv5",
        enabled=False
    )
  
    final_df = dbt.ref("my_first_dbt_model")
    
    return final_df