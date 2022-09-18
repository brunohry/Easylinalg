using Images # read and show Images, more info here: https://github.com/JuliaImages/Images.jl


struct Image <:AbstractVector{Vector{RGB}}
    I
end

begin 
    import Base: +,*,-,^,/,convert,promote_rule,size,reshape,promote,zero,one,iterate,length,abs2,copy,adjoint,vect, promote_typeof
    

    function Image(Name::String)
        img = load(Name)
        vect = Vector{Vector{RGB}}()
        for i in 1:size(img, 2)
           push!(vect, img[:,i] )
        end
        return Image(vect)
    end
    
    function Image(img::Matrix{RGB{Float64}})
        vect = Vector{Vector{RGB}}()
        for i in 1:size(img, 2)
           push!(vect, img[:,i] )
        end
        return Image(vect)
    end

    function ToNativeImage(img::Image)
        return reduce(hcat,img.I)
    end
    
    # addition rule 
    +(x::Image,y::Image) = Image(x.I + y.I)
    -(x::Image,y::Image) =  Image(x.I - y.I)

    # multiplying by scalar
    *(y::Number,x::Image) = Image(x.I * y)
    *(x::Image,y::Real) = *(y::Number,x::Image)
    
    /(x::Image,y::Number) = Image(x.I / y)

    
    size(x::Image) = size(x.I)

    Base.copy(x::Image) = Image(deepcopy(x.I))
    Base.deepcopy(x::Image) = Image(deepcopy(x.I))

    Base.getindex(x::Image, I::Int) = x.I[I]

    Base.setindex!(x::Image, v, I::Int, J::Int) = (x.I[I, j] = v)
    Base.convert(::Type{Image}, a::Matrix{RGB{T}}) where{T} = Image(a)

    Base.zero(::Type{Vector{RGB}}) = Zero()
    
    
end