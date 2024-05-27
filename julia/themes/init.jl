using PlotThemes

include("experiment.jl")
include("slide.jl")
include("darkslide.jl")
include("nepali.jl")
include("paper.jl")

PlotThemes._themes[:slide] = _slide
PlotThemes._themes[:darkslide] = _darkslide
PlotThemes._themes[:experiment] = _experiment
PlotThemes._themes[:nepali] = _nepali;
PlotThemes._themes[:paper] = _paper;
