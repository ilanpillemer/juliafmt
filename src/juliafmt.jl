module juliafmt
using JuliaFormatter

greet() = print("Hello World!")
function julia_main()::Cint
    try
        real_main()
     catch
        Base.invokelatest(Base.display_error, Base.catch_stack())
        return 1
    end
    return 0
end
function real_main()
    #@show ARGS
    if length(ARGS) != 1
        println("usage: one argument with path to file to be formatted")
        return
    end

    print(do_format(ARGS[1]))
end

do_in_place_format(name) = format(name)

function do_format(name)
    str = read(open(name), String)
    format_text(
        str,
        always_for_in = true,
        for_in_replacement = "∈",
        long_to_short_function_def = true,
    )
end

end # module




