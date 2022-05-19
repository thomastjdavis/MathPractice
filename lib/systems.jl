using LinearAlgebra

struct System
    dimension::Int64
    uniqueSolution::Bool
    solution::Vector{Int64} #needs to be length dimension
    coeffs::Matrix{Int64} #needs to be dimension x dimension
    rhs::Vector{Int64} #same length as dimension

end

function randomSystem(dim::Int64)
    if(dim<0 || dim>=4)
        return "";
    end
    vals = -10:1:10;
    solution = rand(vals,dim)
    coeffs = rand(vals,dim,dim)
    
    uniqueSolution = det(coeffs)!==0;
    rhSide = coeffs * solution;

    return System(dim,uniqueSolution,solution,coeffs,rhSide)
end

