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
void MREP_AFEE9B2D1C904380B88C88A48F54E29B(void *, void *);
void MREP_56F7E1BAE6A8489C907CAF5CF55CA6E5(void *, void *);
void MREP_53A71E8EFEC44098B3A30C3B28F1E618(void *, void *);
void MREP_AD8A6F03E7824A3F984D5ECEE6C9E938(void *, void *);
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
MREP_AFEE9B2D1C904380B88C88A48F54E29B(self, 0);
MREP_56F7E1BAE6A8489C907CAF5CF55CA6E5(self, 0);
MREP_53A71E8EFEC44098B3A30C3B28F1E618(self, 0);
MREP_AD8A6F03E7824A3F984D5ECEE6C9E938(self, 0);
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
	initialized = true;
    }
}
