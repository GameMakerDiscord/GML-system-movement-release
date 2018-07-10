/// @description	Calculate FPS

global.average_fps = ((global.average_fps * 0.99) + (fps_real * 0.01));