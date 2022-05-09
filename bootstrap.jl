(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using MathPractice
push!(Base.modules_warned_for, Base.PkgId(MathPractice))
MathPractice.main()
