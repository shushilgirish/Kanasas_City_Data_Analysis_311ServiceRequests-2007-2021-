# 311 Service Request Data Analysis for Kansas City
## Connection Instruction
reference the link to open data website:https://data.kcmo.org/311/311-Call-Center-Service-Requests-2007-March-2021/7at3-sxhp/about_data
The dataset is modified to blend towards course content, hence use the one drive zip file.

Once you unzip the file there will be a TSV file which you will be using. 

1. Use Alteryx to profile your TSV data using the ymd file.
2. alternatively use ydataprofilling using jupyternotebook uploaded
3. Use winrar to extract the Talend ETL file . Connect to ur local database and start running all the corresponding jobs to get the Dimension and FACT table.
4. After loading , connect ur db to POWER BI and Tablue files in the repository .

## Executive Summary
This report offers a comprehensive analysis of Kansas City, MO's 311 service request data from the inception of the system until March 2021. The dataset contains approximately 1.56 million records, each representing a distinct service request. The goal of this analysis is to uncover insights into data structure, quality, and to identify trends and patterns that can drive operational improvements.

## Dataset Overview
The dataset comprises 30 columns and 1,563,215 rows, capturing extensive details about each service request, including identifiers, sources, departments, request types, dates, statuses, and geographic information. The analysis is based on these data points and summarized in the report to provide a clear understanding of the dataset's structure and quality.

### Data Profiling Summary
- **Number of Variables:** 23
- **Number of Observations:** 1,563,215
- **Missing Cells:** 2,595,087 (7.2%)
- **Duplicate Rows:** 0
- **Total Memory Size:** 274.3 MiB
- **Average Record Size:** 184.0 B

### Variable Types
- **Numeric:** 6
- **Categorical:** 7
- **Text:** 6
- **DateTime:** 3

### Key Metrics
- **CASE ID:** Uniquely identifies each service request, ensuring no duplication.
- **SOURCE:** Includes 21 distinct sources of service requests, with major sources being phone, web, and email.
- **STATUS:** Categorized into six distinct values, providing visibility into request progress.
- **DEPARTMENT:** Comprises 27 distinct departments, including Public Works, Water Services, and Parks and Rec.
- **WORK GROUP:** 146 unique work groups associated with the service requests.
- **TYPE:** 295 different types of service requests, ranging from infrastructure maintenance to public health concerns.
- **DETAIL:** 574 distinct details describing each issue.
- **CREATION DATE:** Spanning from December 29, 2006, to October 28, 2021.
- **CREATION TIME:** Ranges from 00:00:00 to 23:59:00.
- **EXCEEDED EST TIMEFRAME:** Boolean indicating if a request exceeded the estimated timeframe.
- **CLOSED DATE:** Ranges from January 4, 2007, to February 11, 2022.
- **DAYS TO CLOSE:** Ranges from -21 to 4525 days.

### Data Quality
- Approximately 7.2% missing data indicates a high-quality dataset with relatively few missing values.
- No duplicate rows ensure the uniqueness of each observation.

## Memory Usage
- **Average Record Size:** 184.0 B
- **Total Size:** 274.3 MiB

## Data Cleaning and Transformation
Extensive ETL processes using Talend were employed to prepare the dataset for analysis:
- **Normalization:** Standardized text fields to a consistent case format.
- **Status Categorization:** Refined status values for improved readability and utility.
- **Time Modification:** Merged creation date and time into a single column for better querying.
- **ClosedDate and Days_to_close:** Adjusted negative values to 0, aligning closed date to merged date if necessary.

## Dimensional Modeling
The dataset was structured into a dimensional model using ER Studio, facilitating efficient querying and analysis. The model includes several dimension tables and a central fact table:

- **Dimension Tables:**
  - `Dim_Source`
  - `Dim_Status`
  - `Dim_Parcel`
  - `Dim_Date`
  - `Dim_Location`
  - `Dim_Category`
- **Fact Table:**
  - `Fact_Case`

## Advanced Analysis
### Talend Transformations:
1. **Kansas_City_Staging Table:**
   - Initial transformation and cleansing steps.
2. **Dim_Category:**
   - Uniquely mapped fields for categorical data.
3. **Dim_Source, Dim_Parcel, Dim_Location, Dim_Date, Dim_Status:**
   - Similar mapping and unique row insertion processes.
4. **Fact_Case:**
   - Created by mapping the cleaned table to the dimension tables.

### SQL Validation and Visualization:
Key analysis questions addressed:
1. **Service Requests Over Time:**
   - Trends from 2018-2021.
2. **Requests by Source:**
   - Trends in service requests by different sources.
3. **Requests by Department:**
   - Trends in service requests received by departments.
4. **Top 10 Performance Metrics (Response Time) per Category and Type:**
   - Fastest response times by request type.
5. **Geographical Visualization:**
   - Top 10 areas with the highest number of requests.
6. **Departmental Workload Comparison:**
   - Distribution of workload among departments and work groups.
7. **Response Time Analysis:**
   - Distribution and patterns of response times by department.
8. **Service Request Status Composition:**
   - Composition of request statuses over the years.
9. **Time to Closure Analysis:**
   - Average days to close requests by category.

## Insights and Recommendations
- **Seasonal Trends:** Inform resource planning and allocation based on seasonal variations in request volumes.
- **Source Optimization:** Enhance efficiency in handling phone and web-based requests.
- **Geographic Targeting:** Prioritize interventions in high-demand areas.

## Conclusion
The 311 service request data for Kansas City is of excellent quality, with a manageable proportion of missing values and no duplicates. This analysis provides detailed insights into the dataset's structure and quality, offering recommendations for operational improvements. Continued monitoring and integration of new data will ensure ongoing service enhancements and citizen satisfaction.


     Thanks for your patience and support !
