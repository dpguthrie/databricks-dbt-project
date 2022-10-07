import pandas as pd

def model(dbt, session):

    dbt.config(materialized="table")

    notebook = 'linked_notebook_test'

    dbutils.notebook.run(notebook, 60)
  
    final_df = dbt.ref("my_first_dbt_model")
    
    return final_df