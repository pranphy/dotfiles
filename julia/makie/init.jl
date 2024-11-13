include("darkslide.jl")

function slide()
    Theme(
        fontsize = 20,
        fonts = Attributes(
                :bold => texfont(:bold),
                :bolditalic => texfont(:bolditalic),
                :italic => texfont(:italic),
                :regular => texfont(:regular)
            ),
    )
end
