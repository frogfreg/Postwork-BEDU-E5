"Este script necesita de el directorio www y el archivo match.data.csv. Estos deben de estar en el mismo directorio que este script"


library(ggplot2)
library(shiny)
library(shinydashboard)
library(shinythemes)

ui <-
    
    fluidPage(dashboardPage(
        dashboardHeader(title = "Postwork 8"),
        
        dashboardSidebar(sidebarMenu(
            menuItem("Gráficos", tabName = "dashboard"),
            menuItem("Goles", tabName = "goles"),
            menuItem("Data Table", tabName = "data_table"),
            menuItem("Imagenes", tabName = "momios")
            
        )),
        
        dashboardBody(tabItems(
            # Histograma
            tabItem(tabName = "dashboard",
                    fluidRow(
                        titlePanel("Goles"),
                        selectInput("x", "Selecciona la variable",
                                    choices = c("FTHG", "FTAG")),
                        
                        
                        
                        plotOutput("plot1", height = 400, width = 700)
                        
                        
                    )),
            
            # imágenes
            tabItem(tabName = "goles",
                    fluidRow(
                        titlePanel(h3("Probabilidad de goles")),
                        
                        img(src = "home_prob.png") ,
                        img(src = "away_prob.png"),
                        img(src = "heatmap.png")
                        
                    )),
            
            
            
            tabItem(tabName = "data_table",
                    fluidRow(
                        titlePanel(h3("Data Table")),
                        dataTableOutput ("data_table")
                    )),
            
            tabItem(tabName = "momios",
                    fluidRow(
                        titlePanel(h3("Imagenes")),
                        h3("Momios Máximo"),
                        img(
                            src = "momios_maximo.png",
                        ),
                        h3("Momios Promedio"),
                        img(
                            src = "momios_promedio.png",
                            
                        )
                    ))
            
        ))
    ))

server <- function(input, output) {
    library(ggplot2)
    
    output$plot1 <- renderPlot({
        data <-
            read.csv(
                "https://raw.githubusercontent.com/beduExpert/Programacion-con-R-2021/main/Sesion-08/Postwork/data.csv",
                header = T
            )
        
        data <-
            mutate(data, FTR = ifelse(FTHG > FTAG, "H", ifelse(FTHG < FTAG, "A", "D")))
        
        x <- data[, input$x]
        
        data %>% ggplot(aes(x, fill = FTR)) +
            geom_bar() +
            facet_wrap("FTAG") +
            labs(x = input$x, y = "Goles") +
            ylim(0, 50)
        
        
    })
    
    
    output$data_table <- renderDataTable({
        data
    },
    options = list(
        aLengthMenu = c(10, 20, 50),
        iDisplayLength = 5
    ))
    
}


shinyApp(ui, server)
