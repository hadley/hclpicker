www_path <- function(...) {
  system.file("www", ..., package = "hclpicker", mustWork = TRUE)
}

hclpicker_deps <- function() {
  list(
    htmltools::htmlDependency("d3", "3.0.0",
      src = www_path(),
      script = "d3.v3.min.js"
    ),
    htmltools::htmlDependency("hclpicker", "0.1.0",
      src = www_path(),
      script = "hcl-picker.js",
      stylesheet = "hcl-picker.css"
    )
  )
}

hclpicker_html <- function() {
  html <- htmltools::htmlTemplate(www_path("hcl-picker.html"), document_ = FALSE)
  htmltools::attachDependencies(html, hclpicker_deps())
}


hclpicker <- function() {
  ui <- shiny::basicPage(hclpicker_html())
  server <- function(input, output) {
  }

  shiny::shinyApp(ui, server)
}
