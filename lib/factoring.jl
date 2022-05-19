function noZero(dims)
    a = rand(-10:10:1,dims)
    if in(0,a)
        return noZero(dims)
    end
    return a
end
function randomFactorProblem()
    ac = noZero(2)
    bd = rand(-10:1:10,2)
    v = [ac[1], ac[2], bd[1], bd[2]]
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
   return ["$(ignoreOne(c1))x^2$(giveSignSymbol(c2))x$(giveSignSymbol(c3))","$(ignoreOne(a))x$(giveSignSymbol(b))","$(ignoreOne(c))x$(giveSignSymbol(d))"]
end

function giveSignSymbol(a)
    if(sign(a)==1)
        return "+$(a)"
    elseif (sign(a)==-1)
        return "-$(abs(a))"
    else
        return ""
    end
end

function ignoreOne(a)
    if a==1
        return ""
    else
        return "$(a)"
    end
end