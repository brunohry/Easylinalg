@testset verbose = true "Arrow2D Testes" begin
    @testset "Build Ops" begin
        # test construction function
        # test type of concatenation
        @test typeof([Arrow2D(1,2), Arrow2D(3,4)]) == Vector{Arrow2D}
        @test typeof(Arrow2D(2,4) / 2) == Arrow2D
    end;
    @testset "Base Ops" begin
        @test Arrow2D(1,2) + Arrow2D(3,4) == Arrow2D(4,6)
        @test Arrow2D(4,6) - Arrow2D(3,4) == Arrow2D(1,2)
        @test Arrow2D(1,2) * 2 == Arrow2D(2,4)
        @test 2 * Arrow2D(1,2) == Arrow2D(2,4)
        @test Arrow2D(2,4) / 2 == Arrow2D(1,2)
    end;
    @testset "Safe Checks" begin
        @test_throws MethodError Arrow2D(1.0, 2.0, 3.0) 
        @test_throws ErrorException Arrow2D(1.0, 2.0)[3]
        @test_throws ErrorException Arrow2D(1.0, 2.0)[3] = 3.0
    end;
    @testset "EasyLinalg" begin
        @test convex_combination( [ Arrow2D(1.0, 2.0), Arrow2D(4.0, 8.0) ], 0.5) == [ Arrow2D(1.0, 2.0), Arrow2D(2.5, 5), Arrow2D(4.0, 8.0) ]
        @test toNumberVector(Arrow2D(1.0, 2.0)) == [1.0, 2.0]
        @test toNumberMatrix( [ Arrow2D(1.0, 2.0), Arrow2D(4.0, 5.0) ] ) == [1.0 4.0; 2.0 5.0]
        @test ([ Arrow2D(1.0, 2.0), Arrow2D(4.0, 5.0) ]) * [ 1.0 0.0; 0.0 1.0] ==  [ Arrow2D(1.0, 2.0), Arrow2D(4.0, 5.0) ]
        @test ([ Arrow2D(1.0, 2.0), Arrow2D(4.0, 5.0) ]) * [ 2.0, 3.0 ] ==  Arrow2D(14.0, 19.0)
        @test (Arrow2D(2.0, 2.0) + Arrow2D(4.0, 6.0) ) / 2.0 ==  Arrow2D(3.0, 4.0)
        @test ([ Arrow2D(1.0, 2.0), Arrow2D( 4.0, 5.0) ]) * [ 2.0 3.0; 4.0 5.0 ] == [ Arrow2D(18.0, 24.0), Arrow2D( 23.0, 31.0 ) ]
        @test ([ Arrow2D(1.0, 2.0), Arrow2D( 4.0, 5.0) ]) \ (([ Arrow2D(1.0, 2.0), Arrow2D( 4.0, 5.0) ]) * [ 2.0 3.0; 4.0 5.0 ]) == [ 2.0 3.0; 4.0 5.0 ]
        @test ([ Arrow2D(1.0, 2.0), Arrow2D( 4.0, 5.0), Arrow2D(7.0, 8.0) ]) \ (([ Arrow2D(1.0, 2.0), Arrow2D( 4.0, 5.0), Arrow2D( 7.0, 8.0) ]) * [ 2.0 3.0; 4.0 5.0; 6.0 7.0]) ≈ [ 2.0 3.0; 4.0 5.0; 6.0 7.0]
        @test ([ Arrow2D(1.0, 2.0), Arrow2D( 4.0, 5.0)]) \ (([ Arrow2D(1.0, 2.0), Arrow2D( 4.0, 5.0) ]) * [ 2.0 , 3.0]) ≈ [ 2.0 , 3.0]
    end;
end;    

