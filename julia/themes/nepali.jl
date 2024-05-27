using PlotThemes, PlotUtils, Plots.PlotMeasures

include("util.jl")

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


