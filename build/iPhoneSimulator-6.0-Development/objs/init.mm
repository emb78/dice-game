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
void MREP_64D36F915FE141A4ADAD661F22004275(void *, void *);
void MREP_9B6FCACB93224F1CA9F82FE3034D58B0(void *, void *);
void MREP_42BEC93CCE6E413FB46B8D1445359E0C(void *, void *);
void MREP_4F48416C457E43E8872EF0626A11D613(void *, void *);
void MREP_37E32016446343FCBEEAC1554F83178E(void *, void *);
void MREP_05F51925A6DB483E8D07458B85509B9B(void *, void *);
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
MREP_64D36F915FE141A4ADAD661F22004275(self, 0);
MREP_9B6FCACB93224F1CA9F82FE3034D58B0(self, 0);
MREP_42BEC93CCE6E413FB46B8D1445359E0C(self, 0);
MREP_4F48416C457E43E8872EF0626A11D613(self, 0);
MREP_37E32016446343FCBEEAC1554F83178E(self, 0);
MREP_05F51925A6DB483E8D07458B85509B9B(self, 0);
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
	initialized = true;
    }
}
