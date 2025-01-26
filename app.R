# Carga packages

library(shiny)
library(tidyverse)
library(lubridate)
library(bizdays)
library(readxl)

# Crea calendarios

fechas <- read_excel("./fechas.xlsx", 
                     col_types = c("date", "date", "date", 
                                   "date", "date", "date", "date", "date"))

create.calendar(name='CalendarioAlmeria',
                start.date='2000-01-01',
                end.date='2050-12-31',
                weekdays= c('saturday','sunday'),
                holidays= fechas$fechasAlmeria)

create.calendar(name='CalendarioCadiz',
                start.date='2000-01-01',
                end.date='2050-12-31',
                weekdays= c('saturday','sunday'),
                holidays= fechas$fechasCadiz)

create.calendar(name='CalendarioCordoba',
                start.date='2000-01-01',
                end.date='2050-12-31',
                weekdays= c('saturday','sunday'),
                holidays= fechas$fechasCordoba)

create.calendar(name='CalendarioGranada',
                start.date='2000-01-01',
                end.date='2050-12-31',
                weekdays= c('saturday','sunday'),
                holidays= fechas$fechasGranada)

create.calendar(name='CalendarioHuelva',
                start.date='2000-01-01',
                end.date='2050-12-31',
                weekdays= c('saturday','sunday'),
                holidays= fechas$fechasHuelva)

create.calendar(name='CalendarioJaen',
                start.date='2000-01-01',
                end.date='2050-12-31',
                weekdays= c('saturday','sunday'),
                holidays= fechas$fechasJaen)

create.calendar(name='CalendarioMalaga',
                start.date='2000-01-01',
                end.date='2050-12-31',
                weekdays= c('saturday','sunday'),
                holidays= fechas$fechasMalaga)

create.calendar(name='CalendarioSevilla',
                start.date='2000-01-01',
                end.date='2050-12-31',
                weekdays= c('saturday','sunday'),
                holidays= fechas$fechasSevilla)

# Define UI

ui <- fluidPage(
  # Application title
  titlePanel("Calendario de plazos administrativos de la Junta de Andalucía. v.1.1.0.LTS"),
  
  # Sidebar with an input
  sidebarLayout(
    sidebarPanel(
      p("Selecciona el municipio:"),
      selectInput("municipio", "Municipio:",
                  c('Almería' = "Almeria",
                    'Cádiz' = "Cadiz",
                    'Córdoba' = "Cordoba",
                    'Granada' = "Granada",
                    'Huelva' = "Huelva",
                    'Jaén' = "Jaen",
                    'Málaga' = "Malaga",
                    'Sevilla' = "Sevilla")),
      h4("Calcular plazo días hábiles"),
      dateInput("date_input", "Día de registro:", value = "2025-01-01", min = 2025-01-01, format="yyyy-mm-dd"),
      numericInput("day_input", "Plazo días hábiles:", value = 30),
      br(),
      h4("Calcular días hábiles transcurridos entre 2 fechas"),
      dateInput("date1_input", "Primer día:", value = "2025-01-01", min = 2025-01-01, format="yyyy-mm-dd"),
      dateInput("date2_input", "Último día:", value = "2025-01-02", min = 2025-01-01, format="yyyy-mm-dd"),
      br(),
      h4("Calcular días naturales transcurridos entre 2 fechas"),
      dateInput("date4_input", "Primer día:", value = "2025-01-01", min = 2025-01-01, format="yyyy-mm-dd"),     
      dateInput("date3_input", "Último día:", value = "2025-01-31", min = 2025-01-01, format="yyyy-mm-dd")
    ),
    
    # Main with output
    mainPanel(
      h4("Resultados plazo días hábiles:"),
      strong(textOutput("text_output"),style = "color:red"),
      p("ojo: cuenta a partir del siguiente día hábil, es decir, el 1º día de la fecha no cuenta."),
      br(),
      h4("Resultados días hábiles transcurridos entre 2 fechas:"),
      strong(textOutput("text_output2"),style = "color:red"),
      p("ojo: cuenta a partir del día siguiente al 1º día y el último día no lo cuenta."),
      br(),
      h4("Resultados días naturales transcurridos entre 2 fechas:"),
      strong(textOutput("text_output3"),style = "color:red"),
      p("ojo: no cuenta el primer, es decir, del 1 al 31 de enero cuenta 30 días."),
      br(),
      br(),
      p("Las fechas del calendario están en el archivo Excel de la carpeta. Sólo hay que modificar las fechas del archivo Excel. Admite fechas entre el 2000-2050.",style = "color:green"),
      p("El calendario es sólo de 1 municipio.",style = "color:green"),
      p("Calendario oficial de días ináviles de la Junta de Andalucía: ",style = "color:green"), 
      a(href="https://www.juntadeandalucia.es/servicios/sede/tramites/calendario-dias-inhabiles.html", "ver enlace")
    )
  )
)

# Define server 

server <- function(input, output) {
  
  output$text_output <- renderPrint({
    if (input$municipio=="Almeria") offset(ymd(input$date_input), n=input$day_input, cal='CalendarioAlmeria')
    else if (input$municipio=="Cadiz") offset(ymd(input$date_input), n=input$day_input, cal='CalendarioCadiz')
    else if (input$municipio=="Cordoba") offset(ymd(input$date_input), n=input$day_input, cal='CalendarioCordoba')
    else if (input$municipio=="Granada") offset(ymd(input$date_input), n=input$day_input, cal='CalendarioGranada')
    else if (input$municipio=="Huelva") offset(ymd(input$date_input), n=input$day_input, cal='CalendarioHuelva')
    else if (input$municipio=="Jaen") offset(ymd(input$date_input), n=input$day_input, cal='CalendarioJaen')
    else if (input$municipio=="Malaga") offset(ymd(input$date_input), n=input$day_input, cal='CalendarioMalaga')
    else  offset(ymd(input$date_input), n=input$day_input, cal='CalendarioSevilla')
})
  
  output$text_output2 <- renderPrint({
    if (input$municipio=="Almeria") bizdays(from=ymd(input$date1_input),to=ymd(input$date2_input), cal='CalendarioAlmeria')
    else if (input$municipio=="Cadiz") bizdays(from=ymd(input$date1_input),to=ymd(input$date2_input), cal='CalendarioCadiz')
    else if (input$municipio=="Cordoba") bizdays(from=ymd(input$date1_input),to=ymd(input$date2_input), cal='CalendarioCordoba')
    else if (input$municipio=="Granada") bizdays(from=ymd(input$date1_input),to=ymd(input$date2_input), cal='CalendarioGranada')
    else if (input$municipio=="Huelvaa") bizdays(from=ymd(input$date1_input),to=ymd(input$date2_input), cal='CalendarioHuelva')
    else if (input$municipio=="Jaen") bizdays(from=ymd(input$date1_input),to=ymd(input$date2_input), cal='CalendarioJaen')
    else if (input$municipio=="Malaga") bizdays(from=ymd(input$date1_input),to=ymd(input$date2_input), cal='CalendarioMalaga')
    else  bizdays(from=ymd(input$date1_input),to=ymd(input$date2_input), cal='CalendarioSevilla')
  })
  
  output$text_output3 <- renderPrint({
    calcula <- ymd(input$date3_input) - ymd(input$date4_input) 
    calcula
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)