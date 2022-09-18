mutable struct Point3D <: AbstractVector{Number}
    x
    y
    z
end


begin 
    import Base: +,*,-,^,/,convert,promote_rule,size,reshape,promote,zero,one,iterate,length,abs2,copy,adjoint,vect, promote_typeof
    
    # addition rule 
    +(a::Point3D,b::Point3D) = Point3D(a.x+b.x, a.y+b.y, a.z+b.z)
    -(a::Point3D,b::Point3D) =  Point3D(a.x-b.x, a.y-b.y, a.z-b.z)

    # multiplying by scalar
    *(b::Real,a::Point3D) = Point3D(a.x * b, a.y * b, a.z * b)
    *(a::Point3D,b::Real) = *(b::Real,a::Point3D)
    
    /(a::Point3D, b::Real) = Point3D(a.x / b, a.y / b, a.z / b)

    
    size(a::Point3D) = size([a.x,a.y,a.z])

    Base.copy(a::Point3D) = Point3D( deepcopy(a.x), deepcopy(a.y), deepcopy(a.z) )
    Base.deepcopy(a::Point3D) = Point3D( deepcopy(a.x), deepcopy(a.y), deepcopy(a.z) )

    Base.getindex(a::Point3D, i::Int) = i > 3 || i < 1 ? error("Point3D can only have size 3") :  [a.x,a.y,a.z][i]
    Base.setindex!(a::Point3D, v, i::Int) = i > 3 || i < 1 ? error("Point3D can only have size 3") : 
        (i == 1 ? (a.x = v) : ( i == 2 ? (a.y = v) : (a.z = v) ) )
    
end