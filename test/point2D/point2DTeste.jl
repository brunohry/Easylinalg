@testset verbose = true "Point2D Testes" begin
    @testset "Build Ops" begin
        # test construction function
        # test type of concatenation
        @test typeof([Point2D(1, 2), Point2D(3, 4)]) == Vector{Point2D}
    end;
    @testset "Base Ops" begin
        @test Point2D(1, 2) + Point2D(3, 4) == Point2D(4, 6)
        @test Point2D(4, 6) - Point2D(3, 4) == Point2D(1, 2)
        @test Point2D(1, 2) * 2 == Point2D(2, 4)
        @test 2 * Point2D(1, 2) == Point2D(2, 4)
        @test Point2D(2, 4) / 2 == Point2D(1, 2)
    end;
    @testset "Safe Checks" begin
        @test_throws MethodError Point2D(1.0, 2.0, 3.0) 
        @test_throws ErrorException Point2D(1.0, 2.0)[3]
        @test_throws ErrorException Point2D(1.0, 2.0)[3] = 3.0
    end;
    @testset "EasyLinalg" begin
        @test convex_combination([Point2D(1.0, 2.0), Point2D(4.0, 8.0) ], 0.5) == [Point2D(1.0, 2.0), Point2D(2.5, 5), Point2D(4.0, 8.0)]
        @test toNumberVector(Point2D(1.0, 2.0)) == [1.0, 2.0]
        @test toNumberMatrix([Point2D(1.0, 2.0), Point2D( 4.0, 5.0) ]) == [1.0 4.0; 2.0 5.0]
        @test (Point2D(1.0, 2.0)) * [ 1.0 0.0; 0.0 -1.0] ==   Point2D(1.0, -2.0) 
        @test ([ Point2D(1.0, 2.0), Point2D(4.0, 5.0) ]) * [ 1.0 0.0; 0.0 1.0] ==  [ Point2D(1.0, 2.0), Point2D(4.0, 5.0) ]
        @test ([ Point2D(1.0, 2.0), Point2D(4.0, 5.0) ]) * [ 2.0, 3.0] ==  Point2D([14.0, 19.0])
        @test ([ Point2D(1.0, 2.0), Point2D( 4.0, 5.0) ]) * [ 2.0 3.0; 4.0 5.0 ] == [ Point2D(18.0, 24.0), Point2D( 23.0, 31.0) ]
        @test ( Point2D(1.0, 2.0) + Point2D( 4.0, 5.0) ) / 2.0 ==  Point2D(2.5, 3.5)
        @test ([ Point2D(1.0, 2.0), Point2D( 4.0, 5.0) ]) \ (([ Point2D(1.0, 2.0), Point2D( 4.0, 5.0) ]) * [ 2.0 3.0; 4.0 5.0 ]) == [ 2.0 3.0; 4.0 5.0 ]
        @test ([ Point2D(1.0, 2.0), Point2D( 4.0, 5.0), Point2D([7.0, 8.0])]) \ (([ Point2D(1.0, 2.0), Point2D( 4.0, 5.0), Point2D( 7.0, 8.0) ]) * [ 2.0 3.0; 4.0 5.0; 6.0 7.0]) ≈ [ 2.0 3.0; 4.0 5.0; 6.0 7.0]
    end;
end;    

