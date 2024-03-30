# NYC Taxis Machine Learning Pipeline

!!! note
    [Link to the repository](https://github.com/tomtaranto/NY_Project)

!!! abstract "Technical skill used"
    *  Apache Airflow
    *  AWS Sagemaker
    *  Python (Pandas)

## Synopsis

A VTC company based in New York has all the data related to trips made by users. The company needs to aggregate all data to extract various information from it.
Each file contains all the trips made in a given month. The aggregated information will have to be calculated automatically daily. It is assumed that each file is added, and/or completed daily in an S3 bucket.


The data and repositories are available [here](https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

Note that for this project, we only consider Yellow Taxi trips made after January 2018.

1. Automate the DynamoDB tables pipeline. The goal is to automate the creation and ingestion of data into DynamoDB tables that contain aggregations of raw data.

Different information is needed:

-  The turnover achieved per driver and per day.
-  The number of trips made per zone and per day.

2. Create daily extracts of training data for the ML model

Using the same or similar pipeline, extracted raw data should be exported to an S3 bucket to allow data scientists to build ML models.

3. Automatically train ML models and expose them via SageMaker pipelines

To provide an optimal user experience, the company wants to automatically estimate the journey according to several parameters (departure area, arrival area, departure time, etc). For this estimation to be as accurate as possible, an ML algorithm must use data collected over a 2-week history.

4. Perform model inference from data ingested in an SQS queue

Once the model is exposed, the inference must be performed by a queue system. We will use SQS with a test code to simulate requests in real time with a frequency close to reality.

