import m5
from m5.objects import *
from caches import *
from optparse import OptionParser

parser = OptionParser()

parser.add_option('--p', "-p", 
            dest = "prog",
            help = "Caminho completo do programa a ser executado.")

parser.add_option("--arg", "-a",
            dest = "prog_args",
            help = "Argumentos do programa a ser executado.\n Uso: Separe os argumentos por \"\ \"\nExemplo: -a arg1\ arg2\ ")

parser.add_option('--b', "-b",
            dest = "branch_p",
            help = "Previsao de desvio a ser utilizado.\nOpcoes disponiveis: ltage | bimode | tournament | local")

(options, args) = parser.parse_args()

branch_dict = {'ltage' : LTAGE(), 'bimode' : BiModeBP(), 'tournament' : TournamentBP(), 'local' : LocalBP() }

system = System()

system.clk_domain = SrcClockDomain()
system.clk_domain.clock = '2GHz'
system.clk_domain.voltage_domain = VoltageDomain()

system.mem_mode = 'timing'
system.mem_ranges = [AddrRange('3GB')]

system.cpu = DerivO3CPU()

system.membus = SystemXBar()

system.cpu.icache = L1ICache()
system.cpu.dcache = L1DCache()

system.cpu.icache.connectCPU(system.cpu)
system.cpu.dcache.connectCPU(system.cpu)

system.l2bus = L2XBar()
system.cpu.icache.connectBus(system.l2bus)
system.cpu.dcache.connectBus(system.l2bus)

system.l2cache = L2Cache()
system.l2cache.connectCPUSideBus(system.l2bus)
system.l2cache.connectMemSideBus(system.membus)

system.cpu.createInterruptController()
system.cpu.interrupts[0].pio = system.membus.master
system.cpu.interrupts[0].int_master = system.membus.slave
system.cpu.interrupts[0].int_slave = system.membus.master

system.system_port = system.membus.slave

system.mem_ctrl = DDR3_1600_8x8()
system.mem_ctrl.range = system.mem_ranges[0]
system.mem_ctrl.port = system.membus.master

process = Process()

if (options.prog == None):
    options.prog = ['tests/test-progs/hello/bin/x86/linux/hello']
    process.cmd = ['tests/test-progs/hello/bin/x86/linux/hello']
else:
    if (options.prog_args != None):
        options.prog = [options.prog]
        options.prog_args =(options.prog_args.split(' '))
        # print(options.prog_args, '\n')
        final = options.prog + options.prog_args
        process.cmd = final
	print(final, '\n')
    else:
        process.cmd = [options.prog]

if (options.branch_p == None or options.branch_p not in branch_dict):
    print("\033[91m" + "Previsão de desvio não reconhecida, utilizando padrão." + "\033[0m")
    print("\033[93m" + "Para mais informações utilize -h ou --help" + "\033[0m")
else:
    system.cpu.branchPred = branch_dict[options.branch_p]

print("\033[93m" + "Programa executado: {0!s}" .format(options.prog))
print("Argumentos utilizados: {0!s}" .format(options.prog_args))
print("Previsão utilizada: {0!s}\n" .format(type(system.cpu.branchPred)) + "\033[0m")

system.cpu.workload = process
system.cpu.createThreads()

root = Root(full_system = False, system = system)
m5.instantiate()

print("\nBeginning simulation!\n")

exit_event = m5.simulate()

print('\nExiting @ tick %i because %s' % (m5.curTick(), exit_event.getCause()))
