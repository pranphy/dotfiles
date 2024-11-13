using PlotThemes, PlotUtils, Plots.PlotMeasures
using PlotThemes, PlotUtils, Plots.PlotMeasures

const dracula_palette_local = [
    colorant"#8be9fd" # Cyan
    colorant"#ff79c6" # Pink
    colorant"#50fa7b" # Green
    colorant"#bd93f9" # Purple
    colorant"#ffb86c" # Orange
    colorant"#ff5555" # Red
    colorant"#f1fa8c" # Yellow
    colorant"#6272a4" # Comment
]
const dracula_bg = colorant"#282a36"
const dracula_fg = colorant"#f8f8f2"



_experiment = PlotThemes.PlotTheme(Dict([
    :size => (800,600),
    :background => :white,
    :framestyle => :box,
    :grid => true,
    :gridalpha => 0.3,
    :linewidth => 1.5,
    :markerstrokewidth => 0,
    :fontfamily => "Computer Modern",
    :colorgradient => :magma,
    :guidefontsize => 14,
    :titlefontsize => 14,
    :legendfontsize => 12,
    :tickfontsize => 10,
    #:palette => dao_palette,
    :minorgrid => true,
    :minorticks => 5,
    :gridlinewidth => 0.6,
    :minorgridalpha => 0.06,
    :legend => :topright,
    :fillalpha => 0.4
    ])
)


_slide = PlotThemes.PlotTheme(Dict([
    :size => (900,600),
    :framestyle => :box,
    :fontfamily => "Computer Modern",
    :margin => 5mm,
    :grid => true,
    :gridalpha => 0.3,
    :linewidth => 2.5,
    :guidefontsize => 22,
    :titlefontsize => 22,
    :legendfontsize => 20,
    :tickfontsize => 18,
    :minorgrid => true,
    :minorticks => 5,
    :gridlinewidth => 0.6,
    :minorgridalpha => 0.06,
    :legend => :topright,
    :fillalpha => 0.4
    ])
)


_paper = PlotThemes.PlotTheme(Dict([
    :size => (900,600),
    :framestyle => :box,
    :fontfamily => "Computer Modern",
    :margin => 3mm,
    :grid => true,
    :gridalpha => 0.3,
    :linewidth => 2.1,
    :guidefontsize => 14,
    :titlefontsize => 16,
    :legendfontsize => 14,
    :tickfontsize => 12,
    :minorgrid => true,
    :minorticks => 5,
    :gridlinewidth => 0.6,
    :minorgridalpha => 0.06,
    :legend => :topright,
    :fillalpha => 0.4
    ])
)




_nepali = PlotThemes.PlotTheme(Dict([
    :bg => dracula_bg,
    :bginside => colorant"#30343B",
    :fg => dracula_fg,
    :fgtext => dracula_fg,
    :fgguide => dracula_fg,
    :fglegend => dracula_fg,
    :legendfontcolor => dracula_fg,
    :legendtitlefontcolor => dracula_fg,
    :titlefontcolor => dracula_fg,
    :palette => PlotThemes.expand_palette(dracula_bg, dracula_palette_local),
    :colorgradient => :viridis,
    :size => (900,600),
    :framestyle => :box,
    :fontfamily => "Noto Serif",
    :margin => 5mm,
    :grid => true,
    :gridalpha => 0.3,
    :linewidth => 2.5,
    :guidefontsize => 24,
    :titlefontsize => 24,
    :legendfontsize => 22,
    :tickfontsize => 20,
    :minorgrid => true,
    :minorticks => 5,
    :markersize => 9,
    :gridlinewidth => 0.6,
    :minorgridalpha => 0.06,
    :legend => :topright,
    :fillalpha => 0.4
    ])
)



_darkslide = PlotThemes.PlotTheme(Dict([
    :bg => dracula_bg,
    :bginside => colorant"#30343B",
    :fg => dracula_fg,
    :fgtext => dracula_fg,
    :fgguide => dracula_fg,
    :fglegend => dracula_fg,
    :legendfontcolor => dracula_fg,
    :legendtitlefontcolor => dracula_fg,
    :titlefontcolor => dracula_fg,
    :palette => PlotThemes.expand_palette(dracula_bg, dracula_palette_local),
    :colorgradient => :viridis,
    :size => (900,600),
    :framestyle => :box,
    :fontfamily => "Computer Modern",
    :margin => 5mm,
    :grid => true,
    :gridalpha => 0.3,
    :linewidth => 2.5,
    :guidefontsize => 24,
    :titlefontsize => 24,
    :legendfontsize => 22,
    :tickfontsize => 20,
    :minorgrid => true,
    :minorticks => 5,
    :markersize => 9,
    :gridlinewidth => 0.6,
    :minorgridalpha => 0.06,
    :legend => :topright,
    :fillalpha => 0.4
    ])
)



PlotThemes._themes[:slide] = _slide
PlotThemes._themes[:darkslide] = _darkslide
PlotThemes._themes[:experiment] = _experiment
PlotThemes._themes[:nepali] = _nepali;
PlotThemes._themes[:paper] = _paper;

