package main

import "vendor:sdl3"

main :: proc() {
    assert(sdl3.Init(sdl3.INIT_VIDEO), "Failed to initialize sdl")
    defer sdl3.Quit()

    win := sdl3.CreateWindow("Asterodin", 800, 600, nil)
    defer sdl3.DestroyWindow(win)

    running := true
    event: sdl3.Event

    for running {
        if sdl3.PollEvent(&event) {
            #partial switch event.type {
                case .QUIT:
                    running = false
            }
        }
    }
}