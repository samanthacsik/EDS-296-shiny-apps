# EDS430-shiny-app

## What's in this repo?

The shiny applications in this repository are meant to accompany the [EDS 296-1W - Intro to Shiny course website](https://ucsb-meds.github.io/EDS-296-Intro-to-Shiny/) created for the Bren School's Master of Environmental Science (MEDS) program.

## Repository structure:

    .
    ├── scratch/                                          # scripts for trying out visuals, analyses, etc. before adding to the app
    │   └── practice_script_app1_penguins.R                 # practice filtering & data viz for App #1  
    │   └── practice_script_app2_animals.R                  # practice filtering & data viz for App #2
    │   └── data_processing_app3_shinydashboard.R           # pre-processing data for App #3
    │   └── practice_script_app3_shinydashboard.R           # practice filtering & data viz for App #3
    |   └── create_fresh_theme_shiny.R                      # build theme using {fresh}; applied to App #2
    |   └── create_fresh_theme_shinydashboard.R             # build theme using {fresh}; applied to shiny dashboard
    |
    ├── raw_data/                                         # raw data files
    |    └── FCWO_lakemonitoringdata_2011_2022_daily.csv    # raw data used by /shinydashboard
    |
    ├── single-file-app/                                  # folder containing the code for App #1, a single-file-app 
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
    |── shinydashboard/                                   # folder containing the code for App #3, a shinydashboard 
    |   └── global.R                                        # packages, objects, etc. used by ui & server
    |   └── ui.R                                            # user interface code
    |   └── server.R                                        # server code
    |   └── data/                                         # folder containing pre-processed data used by the app
    |     └── lake_data_processed.csv                       # processed data (.csv) (raw file in ~/raw_data, processing script in ~/R/data_processing_app3_shinydashboard.R)
    |   └── text/                                         # folder containing markdown files with styled text embedded in app
    |     └── intro.md                                      # welcome page background info text      
    |     └── citation.md                                   # welcome page data citation text
    |     └── disclaimer.md                                 # welcome page disclaimer text
    |   └── www/                                          # special directory in shiny for images, stylesheets, etc. 
    |      └── FishCreekWatershedSiteMap_2020.jpeg          # map for welcome page, downloaded from http://www.fishcreekwatershed.org/images/FishCreekWatershedSiteMap_2020.jpg 
    |
    ├── reactlog-working/                                  # folder containing the code for a functioning app (referenced in debugging section) 
    |   └── app.R                                           # app code
    |   └── www/                                            # special directory in shiny for images, stylesheets, etc. 
    |     └── adelie.gif
    |     └── all_penguins.jpeg   
    |     └── chinstrap.jpeg  
    |     └── gentoo.jpeg  
    |
    ├── reactlog-broken/                                  # folder containing the code for a broken app (referenced in debugging section) 
    |   └── app.R                                           # app code
    |   └── www/                                            # special directory in shiny for images, stylesheets, etc. 
    |     └── adelie.gif
    |     └── all_penguins.jpeg   
    |     └── chinstrap.jpeg  
    |     └── gentoo.jpeg  
    |
    ├── testing-app/                                  # folder containing the code for an app to demo writing tests using {shinytest2}
    |   └── global.R                                       # packages, objects, etc. used by ui & server
    |   └── ui.R                                           # user interface code
    |   └── server.R                                       # server code
    |   └── R/                                             # contains function scripts  
    |   └── tests/                                          # folder containing {shinytest2} test files
    |      └── testthat.R                                     # test runner        
    |      └── testthat/                                      # folder containing tests
    |         └── setup-shinytest2.R                            # app support file information (automatically generated, even if no support files exist)
    |         └── test-shinytest2.R                             # {shinytest2} test
    |         └── snaps/                                        # folder containing test snapshots
    |            └── *.json                                         # JSON representation of the state of app when app$expect_values() was called
    |            └── *_.png                                         # screenshot of app when app$expect_values() was called
    |
    ├── dashboard-css-app/                            # folder containing app used in inspecting/updating css demo
    |    └── global.R                                       # packages, objects, etc. used by ui & server
    |    └── ui.R                                           # user interface code
    |    └── server.R                                       # server code
    |    └── www/                                           # special directory in shiny for images, stylesheets, etc.
    |      └── styles.css                                      # css stylesheet 
    |
    ├── functions-app/                                # folder containing app used during function-writing practice
    |    └── global.R                                       # packages, objects, etc. used by ui & server
    |    └── ui.R                                           # user interface code
    |    └── server.R                                       # server code
    |    └── R/                                             # contains function scripts
    |      └── penguinSpp_pickerInput.R                        # penguinSpp_pickerInput() UI function
    |      └── build_penguin_scatterplot.R                     # build_penguin_scatterplot() server function
    |      └── build_penguin_histogram.R                       # build_penguin_histogram() server function
    |
    ├── module-app/                                   # folder containing apps to demo shiny modules
    |     └── app.R                                      # non-modularized app
    |     └── modularized/                               # folder containing modularized app                           
    |       └── app.R                                    # modularized app
    |       └── gapModule.R                              # module code
    |
    ├── README.md
    ├── .gitignore        
    └── EDS296-shiny-app.Rproj
