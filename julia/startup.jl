push!(LOAD_PATH,ENV["HOME"]*"/repos/Starter.jl/prajulia")
CONFIGDIR=dirname(@__FILE__)

function plots_theme(a)
    include("$(CONFIGDIR)/plots/theme.jl")
    theme(a)
end

include("$(CONFIGDIR)/makie/theme.jl")


देखाऊ = print
