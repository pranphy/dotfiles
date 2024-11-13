function vdark(bg="#282a36")
    Theme(
        #/*
        backgroundcolor = bg,
        textcolor = :white,
        linecolor = :white,
        Axis = (
            backgroundcolor = :transparent,
            bottomspinecolor = :white,
            topspinecolor = :white,
            leftspinecolor = :white,
            rightspinecolor = :white,
            xgridcolor = :gray30,
            ygridcolor = :gray30,
        ),
        Legend = (
                framevisible = false,
                padding = (0, 0, 0, 0),
        ),
    )
end

function slide(fz=20)
    Theme(
        fontsize = fz,
        Lines = (
            linewidth = 5,
        )
    )
end

dark_slide(bg="#282a36",fz=20) =  merge!(slide(fz), vdark(bg))
