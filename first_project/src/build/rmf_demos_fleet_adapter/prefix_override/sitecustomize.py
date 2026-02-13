import sys
if sys.prefix == '/usr':
    sys.real_prefix = sys.prefix
    sys.prefix = sys.exec_prefix = '/home/david/Documentos/GitHub/IR2134/first_project/src/install/rmf_demos_fleet_adapter'
