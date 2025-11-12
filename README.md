# Install `franka_ros2` with `pixi`

## Get Started

### Default franka_ros2 setup
Get started with  [`franka_ros2`](https://github.com/frankarobotics/franka_ros2) faster using pixi:
```bash
pixi run setup
pixi run -e jazzy ros2 launch franka_brigup franka.launch.py robot_ip:=XXX.XXX.XXX.XXX load_gripper:=true
```

#### Use CRISP for control

Control the robots [CRISP](https://utiasdsl.github.io/crisp_controllers/) controllers (cartesian_impedance_controller, joint_impedance_controller ...)
```bash
# Add the CRISP controllers to the installation
pixi run crisp-clone  
pixi run build

pixi run -e jazzy franka robot_ip:=XXX.XXX.XXX.XXX controllers_yaml:=config/controllers.yaml load_gripper:=true
```

In a different terminal test following a figure-eight with the example file:
```bash
pixi run crisp-figure-eight
```

Or simple teleop with fixed orientation:
```bash
# Terminal A
pixi run -e jazzy franka robot_ip:=XXX.XXX.XXX.XXX controllers_yaml:=config/controllers.yaml load_gripper:=true namespace:=left

# Terminal B
pixi run -e jazzy franka robot_ip:=YYY.YYY.YYY.YYY controllers_yaml:=config/controllers.yaml load_gripper:=true namespace:=right

# Terminal C runs a crisp_py example where teleop is enabled
pixi run crisp-teleop
```

