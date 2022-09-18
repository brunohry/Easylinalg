struct Signal <: AbstractVector{Number}
    X
    Y
end


function SignalBuildU(fx, x )
    return Signal(collect(x), fx.(x))
end


function SignalBuild(x, y )
    if(size(x) != size(y))
        error("To Build a Signal, the size of x and y must be the same")
    end
    return Signal(x, y)
end


function dotProduct(x::Signal,y::Signal)
    sum = 0
    for i=1:size(x.Y)[1]
        sum += x.Y[i] * y.Y[i]
    end
    return sum
end

begin 
    import Base: +,*,-,^,/,convert,promote_rule,size,reshape,promote,zero,one,iterate,length,abs2,copy,adjoint,vect, promote_typeof
    # addition rule 
    +(x::Signal,y::Signal) = y.X == x.X ? Signal(x.X, x.Y + y.Y) : error("X array must be equal for every entry")  
    -(x::Signal,y::Signal) = y.X == x.X ? Signal(x.X, x.Y - y.Y) : error("X array must be equal for every entry")

    # dot product
    *(x::Signal,y::Signal) = y.X == x.X ? dotProduct(x,y) : error("X array must be equal for every entry")

    # multiplying by scalar
    *(y::Real,x::Signal) = Signal(x.X, x.Y * y)
    *(x::Signal,y::Real) = *(y::Real,x::Signal)
    
    /(x::Signal, y::Real) = *((1/y::Real),x::Signal)


    # adicionando safecheck na expressão [A, B]
    function Base.vect(K::Signal...)
        for i=1:length(K)
            j = i+1
            if j <= length(K) && K[i].X != K[j].X
                return error("X array must be equal for every entry")
            end
        end
        return copyto!(Vector{Signal}(undef, length(K)), K)
    end
    
    size(x::Signal) = size(x.Y)

    Base.copy(x::Signal) = Signal(copy(x.X), copy(x.Y))

    Base.getindex(x::Signal, i::Int) = Base.getindex(x.Y,i)

    Base.setindex!(x::Signal, v, i::Int) = (x.Y[i] = v)
    
    
end