program private_entities

    use mymodule

    implicit none

    call publicfunc
    !call privatefunc

    !visible = 42

end program private_entities
