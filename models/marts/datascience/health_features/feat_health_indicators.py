import pandas as pd

def model(dbt, session):

    dbt.config(
        materialized="table",
        submission_method="all_purpose_cluster",
        create_notebook=True,
        cluster_id="0426-154059-dox4kjfg"
    )
  
    my_sql_model_df = dbt.ref("fct_health_indicators_pivot")
    
    input_df = my_sql_model_df.orderBy("year").toPandas()
    input_df = pd.concat([input_df['country'], input_df.groupby('country').ffill()], axis=1)
    input_df = pd.concat([input_df['country'], input_df.groupby('country').bfill()], axis=1)
    final_df = spark.createDataFrame(input_df)

    return final_df