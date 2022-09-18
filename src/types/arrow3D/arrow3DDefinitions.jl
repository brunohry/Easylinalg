mutable struct Arrow3D <: AbstractVector{Number}
    i
    j
    k
end


begin 
    import Base: +,*,-,^,/,convert,promote_rule,size,reshape,promote,zero,one,iterate,length,abs2,copy,adjoint,vect, promote_typeof
    
    # addition rule 
    +(a::Arrow3D,b::Arrow3D) = Arrow3D(a.i+b.i, a.j+b.j, a.k+b.k)
    -(a::Arrow3D,b::Arrow3D) =  Arrow3D(a.i-b.i, a.j-b.j, a.k-b.k)

    # multiplying by scalar
    *(b::Real,a::Arrow3D) = Arrow3D(a.i * b, a.j * b, a.k * b)
    *(a::Arrow3D,b::Real) = *(b::Real,a::Arrow3D)
    
    /(a::Arrow3D, b::Real) = *((1/b::Real),a::Arrow3D)

    
    size(a::Arrow3D) = size([a.i,a.j,a.k])

    Base.copy(a::Arrow3D) = Arrow3D( deepcopy(a.i), deepcopy(a.j), deepcopy(a.k) )
    Base.deepcopy(a::Arrow3D) = Arrow3D( deepcopy(a.i), deepcopy(a.j), deepcopy(a.k) )

    Base.getindex(a::Arrow3D, i::Int) = i > 3 || i < 1 ? error("Arrow3D can only have size 3") :  [a.i,a.j,a.k][i]
    Base.setindex!(a::Arrow3D, v, i::Int) = i > 3 || i < 1 ? error("Arrow3D can only have size 3") : 
        (i == 1 ? (a.i = v) : ( i == 2 ? (a.j = v) : (a.k = v) ) )
    # Base.setindex!(a::Arrow3D, v, i::Int) = i > 2 || i < 1 ? error("Arrow3D can only have size 2") : 
    #     (i == 1 ? Arrow3D(v, a.j) : Arrow3D(a.i, v) )
    # Base.setindex!(a::Arrow3D, v, i::Int) = i > 2 || i < 1 ? error("Arrow3D can only have size 2") : ([a.i,a.j][i] = v)
    
    
end