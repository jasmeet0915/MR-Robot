import os
import xacro

from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument, IncludeLaunchDescription
from launch.conditions import IfCondition
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node


def generate_launch_description():

	# get the required paths of packages & files
	pkg_ros_gz_sim = get_package_share_directory('ros_gz_sim')
	pkg_mr_robot_desc = get_package_share_directory('mr_robot_description')
	xacro_path = pkg_mr_robot_desc + '/urdf/mr_robot.xacro'
	
	# TODO: take rviz config file as launch arg 
	# use this one as default
	rviz_config = pkg_mr_robot_desc + '/config/urdf.rviz'

	use_sim_time = LaunchConfiguration('use_sim_time')
	with_rviz = LaunchConfiguration('rviz')

	# create urdf from xacro 
	robot_xacro_config = xacro.process_file(xacro_path)
	robot_urdf = robot_xacro_config.toxml()

	# spawn robot in gz sim using urdf
	spawn_robot = Node(package='ros_gz_sim', executable='create',
				arguments=['-name', 'mr_robot',
					'-x', '2.0',
					'-y', '0.0',
					'-z', '0.0',
					'-Y', '-1.57',
					'-string', robot_urdf],
				output='screen')

	# launch rviz node if rviz parameter was set to true
	rviz = Node(package='rviz2',
				executable='rviz2',
				name='rviz',
#				output='screen',
				arguments=['-d' + rviz_config],
				condition=IfCondition(with_rviz))
	
	# robot state publisher node
	state_publisher = Node(package='robot_state_publisher', 
				executable='robot_state_publisher',
				output='screen',
				parameters = [
					{'ignore_timestamp': False},
					{'use_sim_time': use_sim_time},
					{'use_tf_static': True},
					{'robot_description': robot_urdf}],
				arguments = [robot_urdf])	

	# use_sim_time launch argument
	arg_use_sim_time = DeclareLaunchArgument('use_sim_time',
											default_value='true',
											description="Enable sim time from /clock")
	
	# argument to specify if rviz needs to be launched
	arg_with_rviz = DeclareLaunchArgument('rviz', default_value='false',
											description="Set true to launch rviz")
	
	return LaunchDescription([
		arg_use_sim_time,
		arg_with_rviz,
		spawn_robot,
		rviz,
		state_publisher
	])