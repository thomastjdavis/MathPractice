using SymbolicUtils
SymbolicUtils.show_simplified[] = false
@syms x::Real y::Real z::Real

coeffs = -10:1:10 

function system(n::Int)
    eqs = String[]
    if (n>4) || (n<=1)
        return ""
    end
    M = rand(coeffs,(n,n))
    sols = rand(coeffs,n)
    w = M*sols
    println("""{"coefficients": $M,
                "rh": $w,
                "solutions": $sols}""" )
     
    if (n==2)
        equations = M*[x,y]
        index = 1;
        for col in equations
            push!(eqs,"$(col) = $(w[index])")
            index = index+1;
        end
    end 
    if (n==3)
        equations = M*[x,y,z]
        index = 1;
        for col in equations
            push!(eqs,"$(col) = $(w[index])")
            index = index+1;
        end
    end
    
    return eqs
end

function getSystem(n)
    question = system(n)
    elements = 
    """
    <h2>$(n)x$(n)</h2>
    <ul>
    $(["<li>$(equation)</li>" for equation in question]...)
    </ul>
    <form></form>
    """
end