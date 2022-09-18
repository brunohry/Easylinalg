@testset verbose = true "Arrow3D Testes" begin
    @testset "Build Ops" begin
        # test construction function
        # test type of concatenation
        @test typeof([Arrow3D(1,2,3), Arrow3D(3,4,5)]) == Vector{Arrow3D}
    end;
    @testset "Base Ops" begin
        @test Arrow3D(1,2,3) + Arrow3D(3,4,5) == Arrow3D(4,6,8)
        @test Arrow3D(4,6,8) - Arrow3D(3,4,5) == Arrow3D(1,2,3)
        @test Arrow3D(1,2,3) * 2 == Arrow3D(2,4,6)
        @test 2 * Arrow3D(1,2,3) == Arrow3D(2,4,6)
        @test Arrow3D(2,4,6) / 2 == Arrow3D(1,2,3)
    end;
    @testset "Safe Checks" begin
        @test_throws MethodError Arrow3D(1.0, 2.0, 3.0, 4) 
        @test_throws ErrorException Arrow3D(1.0, 2.0, 3)[4]
        @test_throws ErrorException Arrow3D(1.0, 2.0, 3)[4] = 3.0
    end;
    @testset "EasyLinalg" begin
        @test convex_combination( [ Arrow3D(1.0, 2.0, 3.0), Arrow3D(3.0, 6.0, 9.0 ) ], 0.5) == [ Arrow3D(1.0, 2.0, 3.0), Arrow3D(2.0, 4.0, 6.0 ), Arrow3D(3.0, 6.0, 9.0 ) ]
        @test toNumberVector(Arrow3D(1.0, 2.0, 3.0)) == [1.0, 2.0, 3.0]
        @test toNumberMatrix( [ Arrow3D(1.0, 2.0, 3.0), Arrow3D(3.0, 6.0, 9.0) ] ) == [1.0 3.0; 2.0 6.0; 3.0 9.0]
        @test ([ Arrow3D(1.0, 2.0, 3.0), Arrow3D(3.0, 6.0, 9.0 )  ]) * [ 1.0 0.0; 0.0 1.0] ==  [ Arrow3D(1.0, 2.0, 3.0), Arrow3D(3.0, 6.0, 9.0 )  ]
        @test (Arrow3D(1.0, 2.0, 3.0) + Arrow3D(3.0, 6.0, 9.0 ) ) / 2.0 ==  Arrow3D(2.0, 4.0, 6.0)
        @test ([ Arrow3D(1.0, 2.0, 3.0), Arrow3D(3.0, 6.0, 9.0 )  ]) * [ 2.0, 3.0 ] ==  Arrow3D(11.0, 22.0, 33.0)
        @test ([ Arrow3D(1.0, 2.0, 3.0), Arrow3D(3.0, 6.0, 9.0 )  ]) * [ 2.0 3.0; 4.0 5.0 ] == [ Arrow3D(14.0, 28.0, 42.0), Arrow3D(18.0, 36.0, 54.0) ]
        @test ([ Arrow3D(1.0, 2.0, 3.0), Arrow3D(3.0, 6.0, 9.0 )  ]) \ (([ Arrow3D(1.0, 2.0, 3.0), Arrow3D(3.0, 6.0, 9.0 ) ]) * [ 2.0 3.0; 4.0 5.0 ]) ≈ [ 1.4 1.8; 4.2 5.4 ]
    end;
end;    

