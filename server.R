#rm(list = ls()); cat("\014")
require(openxlsx); require(magrittr); require(tibble); require(plotly); require(shiny); require(shinyjs);  require(openxlsx); require(DT); require(RColorBrewer); require(dplyr); require(shinyhelper); require(shinyWidgets); require(V8)
#bigfolder <- "C:\\cloud\\structure_course dop\\"
#setwd(bigfolder)
getwd()

source("funct/1 dynamic_ggplot.R", encoding = "UTF-8")
source("funct/2 survplot ggplot.R", encoding = "UTF-8")
source("funct/3 ggplot plotly dynamics.R", encoding = "UTF-8")

source("funct/4-0 get_ggplot_hm.R", encoding = "UTF-8")
source("funct/4-1 get_ggplot_histogramm.R", encoding = "UTF-8")


origdata <- read.csv2("data/neurec_clear.csv", encoding = "UTF-8", stringsAsFactors = F)
data_branches_test <- read.csv2("data/data_for_plot.csv", encoding = "UTF-8", stringsAsFactors = F)
hm_data <- read.csv2("data/drop in stable elements.csv", encoding = "UTF-8", stringsAsFactors = F)
all_str <- read.csv2("data/structure course N.csv", encoding = "UTF-8", stringsAsFactors = F)
data_branches_test <- read.csv2("data/data_for_plot.csv", encoding = "UTF-8",  stringsAsFactors = F)

names(all_str)
new_el <- all_str[all_str$`Original..2016.07.25.` == 0 & all_str$`Version.2..2018.09.06.` == 1,]
number_of_newelements <- paste0(new_el$m_ord, new_el$l_ord, new_el$i_ord) %>% as.numeric() #number of new element



server_dynamic <- function(input, output, session){
  
  observe_helpers(help_dir = "helpfiles") #!helpers
  
  output$titleplot <- renderText("Coursera. Введение в нейроэкономику: как мозг принимает решения")
  output$titleplot_voronka <- renderText("Coursera. Введение в нейроэкономику: как мозг принимает решения")
  output$titleplot_dynamic <- renderText("Coursera. Введение в нейроэкономику: как мозг принимает решения")
  output$titleplot_surv_stab <- renderText("Coursera. Введение в нейроэкономику: как мозг принимает решения")
  
  
  output$D_standart <- renderPlot({dynamic0_ggplot(origdata)})
  output$Survival <- renderPlot({surv_ggplot(origdata)})

  
  output$D1_plotly <- renderPlotly({dynamic_plotly(data_branches_test, number_of_newelements)})
  output$HeatMap_ggplot <- renderPlot({get_ggplot(hm_data)})
  output$hist <- renderPlot({histogramm_ggplot(hm_data)})
  
}
 
