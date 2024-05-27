push!(LOAD_PATH,ENV["HOME"]*"/repos/Starter.jl/prajulia")
CONFIGDIR=dirname(@__FILE__)
THEMEDIR="$(CONFIGDIR)/themes"

function mythemes()
    include("$(THEMEDIR)/init.jl"); nothing
end

function mytheme(a)
    include("$(THEMEDIR)/init.jl")
    theme(a)
end


