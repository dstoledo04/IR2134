from setuptools import find_packages, setup

package_name = 'project_tasks'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='elena',
    maintainer_email='elena@todo.todo',
    description='TODO: Package description',
    license='TODO: License declaration',
    extras_require={
        'test': [
            'pytest',
        ],
    },
    entry_points={
    'console_scripts': [
        'dispatch_go_to = project_tasks.dispatch_go_to_place:main',
        'dispatch_patrol = project_tasks.dispatch_patrol:main',
        'dispatch_loop = project_tasks.dispatch_loop:main',
    ],
},

)
