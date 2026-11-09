function nvim
    if count $argv >/dev/null
        command nvim $argv
    else
        command nvim .
    end
end
