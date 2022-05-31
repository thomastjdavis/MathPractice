function noZero(dims)
    a = rand(-10:1:10,dims)
    if in(0,a)
        return noZero(dims)
    end
    return a
end

function factorProblems(n::Int64)
    n<=1 && return randomFactorProblem()

    problems = [randomFactorProblem(difficulty=2)]
    index=2
    while (index<=n)
        v=randomFactorProblem(difficulty=2)
        for j in 1:length(problems)
            if problems[j][:prompt]== v[:prompt]
                continue
            end
        end
        push!(problems,v)
        index = index+1
    end
    
    problems
end

#=TO DO: write different difficulties:
    difficulty=1 -> a and c are both 1, or one of b,d are zero
    difficulty=2 -> a and c are b
    =#
function randomFactorProblem(;difficulty::Int64=1)
    ac = (difficulty==1) ? ones(Int64,2) : noZero(2)
    bd = rand(-10:1:10,2)
    v = vcat(ac[1], bd[1], ac[2], bd[2])
    return multipliedQuadratic(v)
end
function multipliedQuadratic(v::Vector{Int64})
    return multipliedQuadratic(v[1],v[2],v[3],v[4])
end
function multipliedQuadratic(a::Int64,b::Int64,c::Int64,d::Int64)
   c1 = a*c
   c2 = b*c + a*d
   c3 = b*d

   if (sign(c1)==sign(c2) && sign(c1)==sign(c3) && sign(c1)==-1)
    c1= -1 *c1
    c2 = -1*c2
    c3=-1*c3
   end
   problem =  ["$(ignoreOne(c1))x^2$(giveSignSymbol(c2))$(giveSignSymbol(c3,showX=false))","$(ignoreOne(a))x$(giveSignSymbol(b,showX=false))","$(ignoreOne(c))x$(giveSignSymbol(d,showX=false))"]
   Dict(:prompt=>problem[1],:factors=>[problem[2],problem[3]])
end

function giveSignSymbol(a;showX::Bool=true)
    valueString=""
    if (sign(a)==1)
        valueString = "+$(a)"
        if showX
            valueString = valueString*"x"
        end
    elseif (sign(a)==-1)
            valueString = "-$(abs(a))"
        if showX
                valueString = valueString*"x"
        end
    else
        valueString = ""
    end
    
    valueString
end

function ignoreOne(a)
    if a==1
        return ""
    elseif a==-1
        return "-"
    else
        return "$(a)"
    end
end
