# GML-system-movement

Maintained by: Army Armbuster

Thank you for your interest in my movement system.

This is a hybrid collision movement system, consisting of object collisions and/or tileset collisions.

This system features the following:
- 360 degrees sub-pixel movement; rounded in the direction of a hard collision occurring.
- Hard collisions with `o_movement_collision` objects, and with a `tileset`.
- Soft collisions between `o_movement` objects.
- Hard tileset collisions may be configured per `o_movement_controller`.
- Hard tileset collisions may be disabled per `o_movement` object(s).
- Hard objects collisions may be disabled per `o_movement` object(s).
- Soft objects collisions may be disabled per `o_movement` object(s).
- Corner assisted movement, as configured by a percentage margin of the width and height of the `o_movement` object.
- `o_movement` object dimensions may be smaller, equal, or greater than the tileset cell width and/or height set.

## Application Overview
Movement is executed with a single (1) script, and three (3) objects make up the hybrid collision movement system.

### Application Scripts
- `scr_movement_step`

### Application Objects
- `o_movement_collision`
- `o_movement`
- `o_movement_controller`

## Application Scripts

### scr_movement_step
This script will execute movement based on the arguments passed, and on the `o_movement` instance inputs set.

![scr_movement_step.PNG](readme/scr_movement_step.PNG?raw=true)

Here is a table of the inputs used, from the highest priority to the lowest priority:

| Input | Description |
| ----- | ----------- |
| `_input_enabled` | Must be passed as an argument for enabling movement; friction is applied if set to false |
| `input_x_next_` | Internally set as a priority feedback input as enforced by corner assisted movement |
| `input_y_next_` | Internally set as a priority feedback input as enforced by corner assisted movement |
| `input_x_` | Must be set before this script is called, as defined by player inputs |
| `input_y_` | Must be set before this script is called, as defined by player inputs |
| `_input_angle` | Must be passed as an argument for the desired movement direction; undefined otherwise |

Inputs `input_x_next_`, `input_y_next_`, `input_x_`, and `input_y_` are considered cleared when set to `0`.

Inputs `input_x_` and `input_y_` must be set with each begin step event, or at least, before this script is called. 
Inputs `input_x_` and `input_y_` will be set to 0 in the end step event.

Inputs are evaluated separately for the `x` and `y` axis, meaning a part of `_input_angle` could still be used for one of the axis' inputs not set as defined in the priority table above `_input_angle`.

## Application Objects

### `o_movement_collision`

This object can be considered to be the standard collision object as we all know.

![o_movement_collision.PNG](readme/o_movement_collision.PNG?raw=true)

This object has no events, no variables, and no sprite.

It is recommended to create a child of this object, and then give a sprite to the child object to further use in the project.

### `o_movement`

This object is the main movement object to which the `scr_movement_step` applies to.

![o_movement.PNG](readme/o_movement.PNG?raw=true)

It is recommended to create a child of this object (`o_movement_example`), as demonstrated in the example project. There may be as many children as the required number of tileset collision configurations. These children may then be further extended into additional children as required by the actual object implementations. This will abstract the tileset collision `o_movement_controller` object configurations.

Example:
- flying (child of `o_movement` with one tileset `o_movement_controller` configuration child)
- ground (child of `o_movement` with another tileset `o_movement_controller` configuration child)

These examples may then be extended into additional children as required by the implementation.

A single `o_movement_controller` object will be assigned to a `o_movement` object.

Here is a table of the variables and their descriptions:

| Variable | Range | Description |
| -------- | ----- | ----------- |
| z | - | unused |
| move_angle_ | - | current movement angle |
| move_angle_div_ | (0, 360) | move_angle_index_ divisor |
| move_angle_index_ | - | current movement index |
| move_speed_ | - | current movement speed |
| move_speed_z_ | - | unused |
| move_speed_max_ | - | * maximum movement speed |
| move_speed_max_z_ | - | unused |
| move_accel_ | - | * movement acceleration |
| move_accel_z_ | - | unused |
| move_accel_next_ | - | * corner movement acceleration |
| move_friction_enabled_ | - | unused |
| move_friction_ | (0.1, 1.0) | pixel amount by which to apply friction |
| move_bounce_enabled_ | - | enable bounce off collisions |
| move_bounce_ | (0.1, 1.0) | factor by which to adjust movement |
| input_x_ | (-1, 1) | - 1 left, + 1 right |
| input_x_next_ | (-1, 1) | - 1 left, + 1 right |
| input_x_margin_ | (0.1, 0.4) | margin percentage for corner assistance |
| input_y_ | (-1, 1) | - 1 up, + 1 down |
| input_y_next_ | (-1, 1) | - 1 up, + 1 down |
| input_y_margin_ | (0.1, 0.4) | margin percentage for corner assistance |
| input_z_ | (-1, 1) | unused |
| input_z_next_ | (-1, 1) | unused |
| input_z_margin_ | (0.1, 0.4) | unused |
| collision_controller_ | - | * `o_movement_controller` to use for tileset collisions |
| collision_enabled_tileset_ | - | true to enable tileset collisions, false otherwise |
| collision_enabled_objects_ | - | true to enable objects collisions, false otherwise |
| collision_enabled_ | - | true to enable soft `o_movement` collisions, false otherwise |

\* is initially set to `undefined`, and must be set before the object is used.

### `o_movement_controller`

This object is the main tileset configuration object to which hard tileset collisions apply to.

![o_movement_controller.PNG](readme/o_movement_controller.PNG?raw=true)

It is recommended to create a child of this object (`o_movement_controller_example`), as demonstrated in the example project.

There may be as many children as the required number of tileset collision configurations. See the description of `o_movement` for more information.

Here is a table of the variables and their descriptions:

| Variable | Range | Description |
| -------- | ----- | ----------- |
| tileset_cell_w_ | - | * tileset cell width |
| tileset_cell_w_ | - | * tileset cell width |
| tileset_layer_ | - | * tileset layer name with enclosing "" |
| tileset_grid_ | - | internally used |

\* is initially set to `undefined`, and must be set before the object is used.

### Miscellaneous

To enable hard collisions between `o_movement` objects, simply make `o_movement` a child of `o_movement_collision`

NOTE! Due to the nature of hard collisions expected to be integer bounded, these hard collisions may not appear 'perfect'.
