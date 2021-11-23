# Rising Sea Levels and its Impact

## Team Composition and Roles 

We were **Team D (4)** which included 
* Kashyap Bagare - **Circle** - Database  
* Dylan McCullor - **X** - Technologies used 
* Uma Sivakumar - **Triangle** - Machine learning model
* Richard Ybarra - **Square** - GitHub
* Team Collective - **Team** - Readme, Google Slides Presentation

These were the broad self-assigned roles but most of us did a little of everything. 


## Project Overview

In this project we attempt to understand the impact of sea ice extent over sea levels.

### Why Sea Levels Matter?

Global mean sea level has risen about 8–9 inches (21–24 centimeters) since 1880, with about a third of that coming in just the last two and a half decades. In the United States, almost 40 percent of the population lives in relatively high population-density coastal areas, where sea level plays a role in flooding, shoreline erosion, and hazards from storms. Globally, 8 of the world’s 10 largest cities are near a coast, according to the U.N. Atlas of the Oceans.
Rising seas threaten infrastructure like roads, bridges, subways, water supplies, oil and gas wells, power plants, sewage treatment plants, landfills—the list is practically endless.

Higher background water levels mean that deadly and destructive storm surges push farther inland than they once did. More frequent high-tide flooding, sometimes called “nuisance flooding” because it isn't generally deadly or dangerous, but it can be disruptive and expensive. Nuisance flooding is 300%-900% more frequent today than 50 years ago.

### What’s Causing Sea Levels to Rise?

Global warming is causing global mean sea level to rise in two ways. 

  * Glaciers and ice sheets worldwide are melting and adding water to the ocean
  * Second, the volume of the ocean is expanding as the water warms

From the 1970s up through the last decade or so, melting and heat expansion were contributing roughly equally to observed sea level rise. But the melting of mountain glaciers and ice sheets has accelerated:

 * The decadal average loss from glaciers in the World Glacier Monitoring Service’s reference network quintupled over the past few decades
 * Ice loss from the Greenland Ice Sheet increased seven-fold between 1992-2001 to 2012- 2016.
 * Antarctic ice loss nearly quadrupled between 1992-2001 to 2012-2016.

As a result, the amount of sea level rises due to melting from 2005–2013 was nearly twice the amount of sea level rise due to thermal expansion.

### Measuring Sea Level

Sea level is measured by two main methods: tide gauges and satellite altimeters. Since the early 1990s, sea level has been measured from space using radar altimeters, which determine the height of the sea surface by measuring the return speed and intensity of a radar pulse directed at the ocean

## Resources

### Development Environments

* Anaconda – versions 4.10.3
* R Studio

### Tools

* Amazon Web Services 
* PostgreSQL and pgAdmin
* R 
* Python
* Google Colab/Jupyter Notebooks
* Tableau 
* Google Slides

### Dependencies

* Pandas library
* NumPy library
* Matplotlib library
* Sklearn library
* Pillow Image library
* Requests library

### Datasets

* https://www.kaggle.com/kkhandekar/global-sea-level-1993-2021 
* https://www.kaggle.com/nsidcorg/daily-sea-ice-extent-data

## Data Exploration

Global warming and its effects are a wide topic with many aspects to it.  For the purpose of this project, we decided to look at two aspects and see how one impacts the other. We examined the extent of Sea ice and its impacts on Global Mean Sea Levels.  

### Sea Ice Extent

* Primary Source: http://nsidc.org/data/nsidc-0051.html
* Secondary Source: https://www.kaggle.com/nsidcorg/daily-sea-ice-extent-data

The National Snow and Ice Data Center (NSIDC) supports research into our world’s frozen realms: the snow, ice, glaciers, frozen ground, and climate interactions that make up Earth’s cryosphere. NSIDC manages and distributes scientific data, creates tools for data access, supports data users, performs scientific research, and educates the public about the cryosphere.

#### Columns

The dataset provides the total extent for each day for the entire time period (1978-2019). There are 7 variables:

*	**Year**
*	Month
*	Day
*	**Extent: unit is 10^6 sq km**
*	Missing: unit is 10^6 sq km
*	Source: Source data product web site: http://nsidc.org/data/nsidc-0051.html
*	**hemisphere**

For the purpose of our analysis, we have used the columns highlighted in bold

### Sea Level

* Primary Data Source: https://climate.nasa.gov/ 
* Secondary Data Source: https://www.kaggle.com/kkhandekar/global-sea-level-1993-2021 
 
#### Columns

The dataset provides the yearly changes in sea height in mm for the time period 1993-2021 

* **Year**
* Total Weighted Observations
* GMSL (Global Isostatic Adjustment (GIA) not applied) variation (mm) with respect to 20-year TOPEX/Jason collinear mean reference
* Standard Deviation of GMSL (GIA not applied) variation estimate (mm)
* Smoothed (60-day Gaussian type filter) GMSL (GIA not applied) variation (mm)
* **GMSL (Global Isostatic Adjustment (GIA) applied) variation (mm) with respect to 20-year TOPEX/Jason collinear mean reference**
* Standard deviation of GMSL (GIA applied) variation estimate (mm)
* Smoothed (60-day Gaussian type filter) GMSL (GIA applied) variation (mm)
* Smoothed (60-day Gaussian type filter) GMSL (GIA applied) variation (mm); annual and semi-annual signal removed

For the purpose of our analysis, we have used the columns highlighted in bold

## Data Preparation

We used PostgreSQL to help clean and prepare our final data for analysis. The following steps were taken to cleanse the data to make it useable for our project

### Preparing Sea Ice Data

* Remove source data column as it is not relevant to our analysis 
* Select only columns year, extent, hemisphere that are needed for our analysis into a new table called seaicedata 
* Group data by year and hemisphere and order by year 
* Remove south hemisphere data as North hemisphere is most impacted by melting sea ice 
* Change column name for column avg to north_extent

### Preparing Sea Level Data

* Select only columns year and gmsl_gia that are needed for our analysis into a new table called Sealeveldata 
* Creating Seadata 
* Join Seaicedata and Sealeveldata on the year in a new table called Seadata which was used for performing all further analysis in this project 

### Pulling Data from our Database for Analysis

**PostgreSQL – AWS S3 Bucket – Jupyter Notebook** 

To demonstrate our understanding of using Amazon Web Services as well as PostgreSQL we performed all our data cleansing using PostgreSQL then pulled data from PostgreSQL into our S3 bucket created for the purpose of this project and from Amazon Web Services.  We then pulled the data into Jupyter Notebook to run the machine learning model 

**PostgreSQL – R Studio** 

Just to be double sure of our results we also used R to run our model. Here we pulled data directly from PostgreSQL into R and ran our analysis

### Machine Learning - Analysis in R 

* Getting the needed libraries – RPostgreSQL, ggplot2
* Connecting to PostgreSQL database
* Listing all the tables available in the PostgreSQL Database 
* Reading the table of interest seadata
* Summary(seadata)
* A look at the data shows us that 2019 values are quite large and may not be within the range so we need to check for outliers
* Creating a boxplot to check for outliers
* Assigning the outlier values into a vector 
* Checking the results 
* Finding in which rows the outliers are
* Removing the rows containing the outliers
*	Creating a simple scatterplot 
*	Calculating the correlation coefficient 
*	Create linear model 
*	Summarizing the linear model 
*	Plotting scatter and linear model

## Machine Learning Model – Analysis using Python

* Import relevant libraries – Pandas, NumPy, Matplotlib, Skylearn
* Connect to PostgreSQL and to read the SQL tables
* Get table names of the SQL tables in PostgreSQL
* Read the relevant table (seadata) as a dataframe
* Defining X & y variables:  X = Independent variable seadata['north_extent'], y = dependent variable seadata['gmsl_gia']
* Plot the data to check the datapoints 
* The scatter plot revels a linear relationship between north_extent and gmsl_gia.
*	Hence the model of choice will be a Simple Linear Regression
*	The plot indicates that there one data point that looks like an outlier. We need to identify and remove it before running our Linear Regression Model. 
*	Defining the quantile cap & removing all values that are not in the defined range
*	The north_extent for 2019 was an outlier and hence we remove the data for the year 2019
*	Redefining X and y variables with the cleaned dataset after removing the outlier
*	Replotting the data to check the datapoints
*	Splitting the dataset into train and test using the sklearn train and test library 
*	Creating a plot with the larger training dataset (80% of data is used for training purposes)
*	We will keep aside 20% of dataset for testing purposes to test our model
*	Run a regression model on the training data
*	Predicting y using the testing dataset
*	Plot the trend line
*	Print results of the Linear Regression model 

## Results of our Model

### Results of Linear Regression **Model in Python** indicate a strong negative correlation between sealevel rises (gmsl_gia) and seaice extent (north_extent) 

<img width="545" alt="Python_Model_Scatter_Plot" src="https://user-images.githubusercontent.com/85518330/142768507-4cbec690-139b-4b9f-ad72-0cd64b454243.png">

<img width="761" alt="Intercept   Coefficient" src="https://user-images.githubusercontent.com/85518330/142768520-478c1ae0-b1fa-48a4-bfad-dbf1e4329d03.png">

<img width="758" alt="rmse   r2" src="https://user-images.githubusercontent.com/85518330/142768527-ab8600d0-f0ee-4859-9125-b0d1e21b3aba.png">

<img width="725" alt="Pearsons Correlation Coefficient" src="https://user-images.githubusercontent.com/85518330/142768639-8d4b1e2e-89af-4847-a32c-1fae7297867f.png">


### Results of Linear Regression **Model in R** also indicate a strong negative correlation between sealevel rises (gmsl_gia) and seaice extent (north_extent) 

![Rplot](https://user-images.githubusercontent.com/85518330/142768795-5841733a-599c-4074-a892-d0254700f64d.png)

<img width="521" alt="R_Model_results" src="https://user-images.githubusercontent.com/85518330/142768810-411a85c4-30dd-4f6f-a50d-12182ef4b289.png">


## Map Generation

The maps were generated by requesting tiles from the Mapbox RGB terrain data and recompiling using the Pillow image library. The RGB encoded tile set was used in order to get as much detail as possible, as it is recorded in 0.1 meter height increments. The code to accomplish this was heavily borrowed from Douwe Osinga's <a href="https://douwe.com/projects/sealevel">sea level rise</a> project. The data was decoded from RGB encoded values into a numpy array containing height data. This array was then recoded into RGB values representing the projected sea level and flood risk areas.

In order to determine the new global sea level, the y-intercept was taken from our machine learning model and the 2020 sea level average was subtracted from that, which resulted in a change of ~0.4 meters. The mean higher high-water datum for each region was determined from the National Oceanic and Atmospheric Administration's <a href="https://vdatum.noaa.gov/docs/services.html">Vdatum</a> API. This level was added to the projected sea level in order to determine flood risk areas. The image below features a map of New Orleans, LA with the projected sea level mapped in red and flood risk areas mapped in orange.
<br>
<img src="/Map/new_orleans_sm.jpg">


## Tableau Visualizations

Tableau - https://public.tableau.com/app/profile/uma.sivakumar2291/viz/Climate_Change_Group_Project/RisingSealevels?publish=yes

## Google Slides Presentation Link

https://docs.google.com/presentation/d/1g9qqXP4a41h-r0_NjUngBITO3VMvTrsCdHgCnUQCarw/edit#slide=id.p


## Recommendations for Future Analysis

The scope of this project was limited to studying the impact of only seaice extent on sealevel rises. We used yearly averages of both seaice extent and sealevel changes as the sealevel data we used was available as an aggregate for the year only. Our study was limited to the northern hemisphere because we felt it was most impacted by rising sealevels being most populated. However, with more time and resources at hand it may be useful to study the following in future.  

- Study the impact of seaice extent on sea levels in both hemispheres to understand how the Artic and Antarctica respond differently
- Seasonal impacts of seaice on sealevels in the two hemispheres
- Expand the scope of study to include other factors that are causing thermal expansions of the oceans 

## Anything Team Would Have Done Differently 

This project was designed and executed with the aim to demonstrate our team’s capability in putting to use the skills we learnt in the data visualization bootcamp. Hence the project was designed to best demonstrate that. Should the scope of this project be expanded with more time and resources, we may choose to analysis all factors that impact sealevel rises and dive deep into each factor to present a more nuanced perspective
