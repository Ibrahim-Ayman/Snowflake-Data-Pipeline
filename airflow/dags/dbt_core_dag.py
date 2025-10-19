from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta


default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 6, 25),  # Change as needed
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}


dag = DAG(
    'dbt_workflow',
    default_args=default_args,
    description='Run dbt models using dbt Core',
    schedule_interval='@daily',  # Run daily
    catchup=False,
)


DBT_PROJECT_DIR = "/Users/ansamali/snowflake_data_project"  # Update this path


dbt_run = BashOperator(
    task_id='dbt_run',
    bash_command=f'cd {DBT_PROJECT_DIR} && dbt run',
    dag=dag,
)


dbt_test = BashOperator(
    task_id='dbt_test',
    bash_command=f'cd {DBT_PROJECT_DIR} && dbt test',
    dag=dag,
)


dbt_run >> dbt_test 