import pandas as pd

def model(dbt, session):

    dbt.config(materialized="table",
        submission_method="all_purpose_cluster",
        create_notebook=True,
        cluster_id="1121-175813-2agrmn6x")
  
    my_sql_model_df = dbt.ref("feat_health_indicators")
    
    pdf = my_sql_model_df.toPandas()

    pdf.reset_index(inplace=True)
    pdf = pdf.rename(columns = {'index':'Stat'})

    final_df = pdf.describe()

    return final_df