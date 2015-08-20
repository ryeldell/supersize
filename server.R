# C:/Users/robin_000/_NextGen/Google Drive/Collateral/R-course/09-Data Products/FTE_Forecaster
#library(shinyapps)
#shinyapps::deployApp('C:/Users/robin_000/_NextGen/Google Drive/Collateral/R-course/09-Data Products/FTE_Forecaster')

#sliderInput('exp_growth', 'Expected Growth %',value = 5, min = -50, max = 200, step = 5,),
#sliderInput('tgt_ot', 'Target OT%',value = 4, min = 0, max = 50, step = 1,),
#selectizeInput('regn', "Region", c("South","West","North","East"), selected = NULL, multiple = FALSE,options = NULL),
#numericInput("jan_reg_ratio",label = h5("Jan"), value = 110),



library(plyr);
library(ggplot2);
req_hrs <- readRDS("FTE_Hours_Req.Rds")

shinyServer(
     function(input, output) {

#          reactive({
#          })
          output$myPlot <- renderPlot({
               fte_req <- subset(req_hrs,Region == input$regn);
               fte_req$ratio <- c(input$jan_reg_ratio
                                  ,input$feb_reg_ratio
                                  ,input$mar_reg_ratio
                                  ,input$apr_reg_ratio
                                  ,input$may_reg_ratio
                                  ,input$jun_reg_ratio
                                  ,input$jul_reg_ratio
                                  ,input$aug_reg_ratio
                                  ,input$sep_reg_ratio
                                  ,input$oct_reg_ratio
                                  ,input$nov_reg_ratio
                                  ,input$dec_reg_ratio);
               
               fte_req$FTE_Requirement <- (fte_req$Hours_Requirement / fte_req$ratio) * 
                    (1 + (input$exp_growth / 100)) / 
                    (1 + (input$tgt_ot / 100));
               
               fte_req$FTE_Requirement <- round(fte_req$FTE_Requirement);
               
               fte_req <- ddply(fte_req, .(Month), transform, 
                                pos = cumsum(FTE_Requirement) - (0.5 * FTE_Requirement)
               );
               ggplot(fte_req, aes(x = Month, y = FTE_Requirement)) +
                    geom_bar(aes(fill = Job_Desc), stat="identity") +
                    geom_text(aes(label = FTE_Requirement, y = pos), size = 3) +
                    ylim(0,17000) +
                    theme(legend.position="bottom");
          })
          
     }
)


