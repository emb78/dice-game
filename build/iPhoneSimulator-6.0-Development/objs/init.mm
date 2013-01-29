#import <UIKit/UIKit.h>

extern "C" {
    void ruby_sysinit(int *, char ***);
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void ruby_set_argv(int, char **);
    void rb_vm_init_compiler(void);
    void rb_vm_init_jit(void);
    void rb_vm_aot_feature_provide(const char *, void *);
    void *rb_vm_top_self(void);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
void MREP_F713D813F31343E49DEAA33E3AF1AEB1(void *, void *);
void MREP_87736955B9944ABE956AD8A0A3A6008C(void *, void *);
void MREP_EC36F7838A094CB1A486B3BDF8ECD278(void *, void *);
void MREP_6AE6D49DFF3C4080AC4E4F94E1CCFE32(void *, void *);
void MREP_78535FA9A8294C2CBFB189C70F322A7A(void *, void *);
void MREP_D81ED457751645E38C921B16245CC5F5(void *, void *);
void MREP_740D099BBDDD43CA99F2474838F0F989(void *, void *);
}

extern "C"
void
RubyMotionInit(int argc, char **argv)
{
    static bool initialized = false;
    if (!initialized) {
	ruby_init();
	ruby_init_loadpath();
        if (argc > 0) {
	    const char *progname = argv[0];
	    ruby_script(progname);
	}
	try {
	    void *self = rb_vm_top_self();
MREP_F713D813F31343E49DEAA33E3AF1AEB1(self, 0);
MREP_87736955B9944ABE956AD8A0A3A6008C(self, 0);
MREP_EC36F7838A094CB1A486B3BDF8ECD278(self, 0);
MREP_6AE6D49DFF3C4080AC4E4F94E1CCFE32(self, 0);
MREP_78535FA9A8294C2CBFB189C70F322A7A(self, 0);
MREP_D81ED457751645E38C921B16245CC5F5(self, 0);
MREP_740D099BBDDD43CA99F2474838F0F989(self, 0);
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
	initialized = true;
    }
}
