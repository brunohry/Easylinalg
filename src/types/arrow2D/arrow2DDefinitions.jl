mutable struct Arrow2D <: AbstractVector{Number}
    i
    j
end

begin 
    import Base: +,*,-,^,/,convert,promote_rule,size,reshape,promote,zero,one,iterate,length,abs2,copy,adjoint,vect, promote_typeof
    
    # addition rule 
    +(a::Arrow2D,b::Arrow2D) = Arrow2D(a.i+b.i, a.j+b.j)
    -(a::Arrow2D,b::Arrow2D) =  Arrow2D(a.i-b.i, a.j-b.j)

    # multiplying by scalar
    *(b::Real,a::Arrow2D) = Arrow2D(a.i * b, a.j * b)
    *(a::Arrow2D,b::Real) = *(b::Real,a::Arrow2D)
    
    /(a::Arrow2D,b::Real) = Arrow2D(a.i / b, a.j / b)

    
    size(a::Arrow2D) = size([a.i,a.j])

    Base.copy(a::Arrow2D) = Arrow2D( deepcopy(a.i), deepcopy(a.j) )
    Base.deepcopy(a::Arrow2D) = Arrow2D( deepcopy(a.i), deepcopy(a.j) )

    Base.getindex(a::Arrow2D, i::Int) = i > 2 || i < 1 ? error("Arrow2D can only have size 2") :  [a.i,a.j][i]
    Base.setindex!(a::Arrow2D, v, i::Int) = i > 2 || i < 1 ? error("Arrow2D can only have size 2") : 
        (i == 1 ? (a.i = v) : (a.j = v) )
    # Base.setindex!(a::Arrow2D, v, i::Int) = i > 2 || i < 1 ? error("Arrow2D can only have size 2") : 
    #     (i == 1 ? Arrow2D(v, a.j) : Arrow2D(a.i, v) )
    # Base.setindex!(a::Arrow2D, v, i::Int) = i > 2 || i < 1 ? error("Arrow2D can only have size 2") : ([a.i,a.j][i] = v)
    
    
end