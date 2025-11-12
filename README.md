# Install `franka_ros2` with `pixi`

Get started with  [`franka_ros2`](https://github.com/frankarobotics/franka_ros2) faster using pixi:
```bash
pixi run setup
pixi run ros2 launch franka_brigup franka.launch.py robot_ip:=XXX.XXX.XXX.XXX load_gripper:=true namespace:=right
```

Using the [CRISP](https://utiasdsl.github.io/crisp_controllers/) controllers (cartesian_impedance_controller, joint_impedance_controller ...)
```bash
# Add the CRISP controllers to the installation
pixi run crisp-clone  
pixi run build

pixi run franka robot_ip:=XXX.XXX.XXX.XXX controllers_yaml:=config/controllers.yaml load_gripper:=true
```

Test following a figure-eight with the example file:
```bash
pixi run figure-eight
```
