shinyUI(pageWithSidebar(
     headerPanel("Super Size Fast Food Staff Planner"),
     sidebarPanel(
          sliderInput('exp_growth', 'Expected Growth %',value = 5, min = -50, max = 50, step = 5,),
          sliderInput('tgt_ot', 'Target OT%',value = 4, min = 0, max = 50, step = 1,),
          selectizeInput('regn', "Region", c("South","West","North","East"), selected = NULL, multiple = FALSE,
                         options = NULL),
          h4("Monthly # of Regular Hrs/FTE"),
          numericInput("jan_reg_ratio",label = h5("Jan"), value = 110),
          numericInput("feb_reg_ratio",label = h5("Feb"), value = 110),
          numericInput("mar_reg_ratio",label = h5("Mar"), value = 110),
          numericInput("apr_reg_ratio",label = h5("Apr"), value = 110),
          numericInput("may_reg_ratio",label = h5("May"), value = 110),
          numericInput("jun_reg_ratio",label = h5("Jun"), value = 110),
          numericInput("jul_reg_ratio",label = h5("Jul"), value = 110),
          numericInput("aug_reg_ratio",label = h5("Aug"), value = 110),
          numericInput("sep_reg_ratio",label = h5("Sep"), value = 110),
          numericInput("oct_reg_ratio",label = h5("Oct"), value = 110),
          numericInput("nov_reg_ratio",label = h5("Nov"), value = 110),
          numericInput("dec_reg_ratio",label = h5("Dec"), value = 110)
#          ,width=4
     ),
     mainPanel(
          plotOutput('myPlot'),
          h4("Instructions"),
          p("This applications assists you with determining what staffing is required for your region of the Super Size restaurant chain."),
          tags$ol(
               tags$li("Set your expected growth rate."),
               tags$li("Set the OT % as the % of total hours worked that will paid OT work."),
               tags$li("Select your region."),
               tags$li("For each month enter the average number of hours an average employee works in that month. This allows for seasonality of average hours."),
               tags$li("The output chart shows the number of FTEs for each role at the restaurant.")
          )
     )
))