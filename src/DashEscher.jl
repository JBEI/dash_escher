
module DashEscher
using Dash

const resources_path = realpath(joinpath( @__DIR__, "..", "deps"))
const version = "0.0.4"

include("jl/dashescher.jl")

function __init__()
    DashBase.register_package(
        DashBase.ResourcePkg(
            "dash_escher",
            resources_path,
            version = version,
            [
                DashBase.Resource(
    relative_package_path = "dash_escher.min.js",
    external_url = "https://unpkg.com/dash_escher@0.0.4/dash_escher/dash_escher.min.js",
    dynamic = nothing,
    async = nothing,
    type = :js
),
DashBase.Resource(
    relative_package_path = "dash_escher.min.js.map",
    external_url = "https://unpkg.com/dash_escher@0.0.4/dash_escher/dash_escher.min.js.map",
    dynamic = true,
    async = nothing,
    type = :js
)
            ]
        )

    )
end
end
