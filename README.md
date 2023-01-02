# EDS430-shiny-app

## What's in this repo?

The shiny applications in this repository are meant to accompany the [EDS 430 - Intro to Shiny slide deck](https://ucsb-meds.github.io/EDS430-Shiny/#/title-slide) created for the Bren School's Master of Environmental Science (MEDS) program.

## Repository structure:

```
.
├── R/                                                # scripts for trying out visuals and analyses before adding to the app
│   └── practice_script_app1_penguins.R                 # practice filtering & data viz for App #1  
│   └── practice_script_app2_animals.R                  # practice filtering & data viz for App #2
│   └── data_processing_app3_shinydashboard.R           # pre-processing data for App #3
│   └── practice_script_app3_shinydashboard.R           # practice filtering & data viz for App #3
|
├── raw_data/                                         # raw data files
|    └── FCWO_lakemonitoringdata_2011_2022_daily.csv    # raw data used by /shinydashboard
|
├── one-file-app/                                     # folder containing the code for App #1, a single-file-app (instructions begin on slide ?)
|   └── app.R                                           # app code
|    
├── two-file-app/                                     # folder containing the code for App #2, a two-file-app deployed on shinyapps.io (instructions begin on slide ?)
|   └── global.R                                        # packages, objects, etc. used by ui & server
|   └── ui.R                                            # user interface code
|   └── server.R                                        # server code
|   └── rsconnect/shinyapps.io/samanthacsik             # contains DCF file with info on deployed app             
|   └── text/                                         # folder containing markdown files with styled text embedded in app
|     └── about.md                                      # landing page background info text      
|     └── footer.md                                     # landing page footer text
|
|── shinydashboard/                                   # folder containing the code for App #3, a shinydashboard (instructions begin on slide ?)
|   └── global.R                                        # packages, objects, etc. used by ui & server
|   └── ui.R                                            # user interface code
|   └── server.R                                        # server code
|   └── data/                                         # folder containing pre-processed data used by the app
|     └── lake_data_processed.csv                       # processed data (.csv) (raw file in ~/raw_data, processing script in ~/R/data_processing_app3_shinydashboard.R)
|     └── lake_data_processed.rds                       # processed data (.rds) (raw file in ~/raw_data, processing script in ~R/data_processing_app3_shinydashboard.R)
|   └── text/                                         # folder containing markdown files with styled text embedded in app
|     └── intro.md                                      # welcome page background info text      
|     └── citation.md                                   # welcome page data citation text
|     └── disclaimer.md                                 # welcome page disclaimer text
|   └── www/                                          # special directory in shiny for images, stylesheets, etc. 
|      └── FishCreekWatershedSiteMap_2020.jpeg          # map for welcome page, downloaded from http://www.fishcreekwatershed.org/images/FishCreekWatershedSiteMap_2020.jpg 
|
├── README.md
├── .gitignore        
├── .DS_store
└── EDS430-shiny-app.Rproj
```
