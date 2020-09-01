#rm(list = ls()); cat("\014")
require(openxlsx); require(magrittr); require(tibble); require(plotly); require(shiny); require(shinyjs);  require(openxlsx); require(DT); require(RColorBrewer); require(dplyr); require(shinyhelper); require(shinyWidgets); require(V8)
#bigfolder <- "C:\\cloud\\structure_course\\"
#setwd(bigfolder)


### UI ###
ui_dynamic <-  fluidPage(
  
  
  
  sidebarLayout(
    sidebarPanel(
      width = .2,
      selectInput(
        inputId = 'course',
        label = 'Выберите курс',
        choices = 'Нейроэкономика'
      )
    ),
  
  mainPanel(
    tabsetPanel(
      type = "tab",
      
      tabPanel(
        h4('Воронка'),
        textOutput("titleplot")  %>% helper(type='markdown', content = "1_voronka", buttonLabel = "ВЫХОД"),
        br(),
          #helper(type='markdown', content = "1_voronka.md", buttonLabel = "ВЫХОД"),
        plotOutput("D_standart", height = "1500px", width = "1500px") 
      ),
      
      tabPanel(
        h4('Выживаемость'),
        textOutput("titleplot_voronka")%>% helper(type='markdown', content = "2_surv", buttonLabel = "ВЫХОД"),
        br(),
        plotOutput("Survival", height = "1500px", width = "1500px")
      ),
      

      
      tabPanel(
        h4('Динамика отсева студентов'),
        textOutput("titleplot_dynamic") %>% helper(type='markdown', content = "3_dyna", buttonLabel = "ВЫХОД"),
        br(),
        plotlyOutput("D1_plotly", height = "1200px", width = "900px")
        ),
      
      tabPanel(
        h4('Доля не завершивших студентов'),
        textOutput("titleplot_surv_stab")%>% helper(type='markdown', content = "4_surv_stab", buttonLabel = "ВЫХОД"),
        br(),
        plotOutput("HeatMap_ggplot", height = "1000px", width = "900px")
        
        )
    )
  )
)
)


