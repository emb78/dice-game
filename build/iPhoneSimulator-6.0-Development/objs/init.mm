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
void MREP_CCC0AA737F0F473A832F33771C94F43E(void *, void *);
void MREP_59246B7D71BB4C42A4841A9D47E65D33(void *, void *);
void MREP_D492A1E793BD423BA4D859E4D301B30B(void *, void *);
void MREP_EA4E78BF1C2C406D8E560BDE0AB33D92(void *, void *);
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
MREP_CCC0AA737F0F473A832F33771C94F43E(self, 0);
MREP_59246B7D71BB4C42A4841A9D47E65D33(self, 0);
MREP_D492A1E793BD423BA4D859E4D301B30B(self, 0);
MREP_EA4E78BF1C2C406D8E560BDE0AB33D92(self, 0);
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
	initialized = true;
    }
}
