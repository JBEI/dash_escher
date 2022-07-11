# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dashEscher <- function(id=NULL, height=NULL, mapData=NULL, modelData=NULL, options=NULL, width=NULL) {
    
    props <- list(id=id, height=height, mapData=mapData, modelData=modelData, options=options, width=width)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'DashEscher',
        namespace = 'dash_escher',
        propNames = c('id', 'height', 'mapData', 'modelData', 'options', 'width'),
        package = 'dashEscher'
        )

    structure(component, class = c('dash_component', 'list'))
}
