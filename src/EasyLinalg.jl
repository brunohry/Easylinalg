module EasyLinalg
    using Plots

    include(joinpath("types", "zero", "zeroDefinitions.jl"))
    include(joinpath("types", "signal", "signalDefinitions.jl"))
    include(joinpath("types", "point2D", "point2DDefinitions.jl"))
    include(joinpath("types", "point3D", "point3DDefinitions.jl"))
    include(joinpath("types", "arrow2D", "arrow2DDefinitions.jl"))
    include(joinpath("types", "arrow3D", "arrow3DDefinitions.jl"))
    include(joinpath("types", "image", "imageDefinitions.jl"))
    include(joinpath("basics", "operations.jl"))
    include(joinpath("basics", "draws.jl"))

    export Draw
    export Zero
    export Signal, SignalBuildU, SignalBuild
    export Point2D
    export Point3D
    export Image, ToNativeImage
    export Arrow3D
    export Arrow2D
    export toNumberMatrix, toNumberVector, convex_combination, RunMarkovChain




end # module
