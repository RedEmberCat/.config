print(' -- Globals Namespace with empty script -- \n')
print(globals())
global_variable = 'global'

def print_global():
    global_variable = 'nested global'
    nested_variable = 'nested value'

print(' \n -- Globals Namespace non-empty script -- \n')
print(globals())
