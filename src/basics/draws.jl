include(joinpath("..", "types", "zero", "zeroDefinitions.jl"))
include(joinpath("..", "types", "Signal", "SignalDefinitions.jl"))
include(joinpath("..", "types", "Point2D", "Point2DDefinitions.jl"))
include(joinpath("..", "types", "Point3D", "Point3DDefinitions.jl"))
include(joinpath("..", "types", "Arrow2D", "Arrow2DDefinitions.jl"))
include(joinpath("..", "types", "Arrow3D", "Arrow3DDefinitions.jl"))
include(joinpath("..", "types", "Image", "ImageDefinitions.jl"))

types = Union{Signal, Point2D, Point3D, Arrow2D, Arrow3D}

function Draw(A::types, clear = true, separate = false)
    return Draw([A], clear, separate)
end

function Draw(A::Vector{Arrow2D}, clear = true, separate = false)
    if(clear)
        plot()
    end
    m=size(A)[1]
    plotsX = []
    plotsY = []
    for i=1:m
        append!(plotsX, [[0, A[i].i]])
        append!(plotsY, [[0, A[i].j]])
    end
    
    if(!separate)
        p = plot!(plotsX[1], plotsY[1], arrow=true, label="")
        for i=2:size(plotsY)[1]
            plot!(p, plotsX[i], plotsY[i], arrow=true, label="")
        end
        return p
    end
    
    return plot(plotsX,plotsY, arrow=true, layout = (m, 1), label="")

end


function Draw(A::Vector{Arrow3D}, clear = true, separate = false)
    if(clear)
        plot()
    end
    m=size(A)[1]
    plotsX = []
    plotsY = []
    plotsZ = []
    for i=1:m
        append!(plotsX, [[0, A[i].i]])
        append!(plotsY, [[0, A[i].j]])
        append!(plotsZ, [[0, A[i].k]])
    end

    if(!separate)
        p = plot!(plotsX[1], plotsY[1], plotsZ[1], arrow=true, label="")
        for i=2:size(plotsY)[1]
            plot!(p, plotsX[i], plotsY[i], plotsZ[i], arrow=true, label="")
        end
        return p
    end
    
    return plot(plotsX,plotsY,plotsZ, arrow=true, layout = (m, 1), label="")

end

function Draw(A::Vector{Point2D}, clear = true, separate = false)
    if(clear)
        plot()
    end
    m=size(A)[1]
    plotsX = []
    plotsY = []
    for i=1:m
        append!(plotsX, [[A[i].x]])
        append!(plotsY, [[A[i].y]])
    end
    
    if(!separate)
        p = plot!(plotsX[1], plotsY[1], seriestype = "scatter", label="")
        for i=2:size(plotsY)[1]
            plot!(p, plotsX[i], plotsY[i], seriestype = "scatter" , label="")
        end
        return p
    end
    
    return plot(plotsX,plotsY, seriestype = "scatter" , layout = (m, 1), label="")

end


function Draw(A::Vector{Point3D}, clear = true, separate = false)
    if(clear)
        plot()
    end
    m=size(A)[1]
    plotsX = []
    plotsY = []
    plotsZ = []
    for i=1:m
        append!(plotsX, [[A[i].x]])
        append!(plotsY, [[A[i].y]])
        append!(plotsZ, [[A[i].z]])
    end
    
    if(!separate)
        p = plot!(plotsX[1], plotsY[1], plotsZ[1], seriestype = "scatter", label="")
        for i=2:size(plotsY)[1]
            plot!(p, plotsX[i], plotsY[i], plotsZ[i], seriestype = "scatter", label="")
        end
        return p
    end
    
    return plot(plotsX,plotsY, seriestype = "scatter", layout = (m, 1), label="")

end

function Draw(A::Vector{Signal}, clear = true, separate = false)
    if(clear)
        plot()
    end
    m=size(A)[1]
    plotsX = []
    plotsY = []
    
    for i=1:m
        append!(plotsX, [A[i].X])
        append!(plotsY, [A[i].Y])
    end

    if(!separate)
        p = plot!(plotsX[1], plotsY[1])
        for i=2:size(plotsY)[1]
            plot!(p, plotsX[i], plotsY[i])
        end
        
        return p
    end

    return plot(plotsX,plotsY, layout = (size(plotsY)[1], 1))

end

function Draw(A::Image)
    display(ToNativeImage(A))
end

function Draw(S::Vector{<:Image})  
    m=size(S)[1]
    for i=1:m
        Draw(S[i])
    end
end
