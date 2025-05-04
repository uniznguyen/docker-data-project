from airflow import DAG
from airflow.operators.empty import EmptyOperator
from airflow.operators.python import PythonOperator
from datetime import datetime

def example_task():
    print("This is an example task.")

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2023, 1, 1),
    'retries': 1,
}

dag = DAG(
    'example_dag',
    default_args=default_args,
    description='An example DAG for demonstration purposes',
    schedule='@daily',
)

start = EmptyOperator(
    task_id='start',
    dag=dag,
)

example_task_operator = PythonOperator(
    task_id='example_task',
    python_callable=example_task,
    dag=dag,
)

start >> example_task_operator