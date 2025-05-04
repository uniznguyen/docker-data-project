# Docker Data Project

This project sets up a complete data engineering environment with:

- Python 3.11
- Apache Airflow 3.0
- dbt (Data Build Tool)
- PostgreSQL
- HR Training Form Web Application

## Prerequisites

- Docker Engine
- Docker Compose

## Getting Started

1. Clone this repository
2. Navigate to the project directory
3. Run the following command to start all services:

```bash
docker-compose up -d
```

## Services

### PostgreSQL

- **Port**: 5432
- **Username**: user
- **Password**: password
- **Database**: dbname

PostgreSQL is initialized with sample tables and data for demonstration.

### Apache Airflow

- **URL**: http://localhost:8080
- **Username**: admin
- **Password**: admin

The Airflow UI is accessible via a web browser at http://localhost:8080.
Default login credentials are admin/admin.

### dbt (Data Build Tool)

The dbt service is configured to work with PostgreSQL.

### HR Training Form Application

- **URL**: http://localhost:5000
- **Purpose**: Web application for HR training form submissions
- **Data Storage**: SQLite database (persistent)

The HR Training Form application allows users to submit information about training programs, including program details, supplier information, and certificate uploads.

## Project Structure

```
docker-data-project/
├── airflow/
│   ├── config/
│   │   └── airflow.cfg         # Airflow configuration
│   └── dags/
│       └── example_dag.py      # Example Airflow DAG
├── dbt/
│   ├── models/
│   │   └── example/
│   │       └── example_model.sql  # Example dbt model
│   ├── dbt_project.yml         # dbt project configuration
│   └── profiles.yml            # dbt connection profiles
├── hrtrainingform/             # HR Training Form Application
│   ├── data/                   # JSON configuration files
│   ├── static/                 # CSS and static assets
│   ├── templates/              # HTML templates
│   ├── certificates/           # Uploaded certificates
│   ├── db/                     # SQLite database
│   ├── Dockerfile              # Container specification
│   ├── main.py                 # Application entry point
│   └── requirements.txt        # Python dependencies
├── postgres/
│   └── init.sql                # PostgreSQL initialization script
├── docker-compose.yml          # Docker Compose configuration
├── Dockerfile                  # Dockerfile for Python services
├── .dockerignore               # Docker build exclusions
├── requirements.txt            # Python dependencies
└── README.md                   # Project documentation
```

## Usage Examples

### Run a dbt command

```bash
docker-compose run dbt dbt run
```

### Check Airflow DAGs

Access the Airflow UI at http://localhost:8080 to manage and monitor your data pipelines.

## Customization

- Modify `postgres/init.sql` to change the database schema
- Add new DAGs in the `airflow/dags/` directory
- Create new dbt models in the `dbt/models/` directory

## Stopping the Services

To stop all services:

```bash
docker-compose down
```

To stop and remove volumes (this will delete all data):

```bash
docker-compose down -v
```

## Contributing

Feel free to submit issues or pull requests to improve the project. 

## License

This project is licensed under the MIT License.