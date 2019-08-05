# -- FILE: features/environment.py

# https://behave.readthedocs.io/en/latest/tutorial.html
# USE: behave -D BEHAVE_DEBUG_ON_ERROR         (to enable  debug-on-error)
# USE: behave -D BEHAVE_DEBUG_ON_ERROR=yes     (to enable  debug-on-error)
# USE: behave -D BEHAVE_DEBUG_ON_ERROR=no      (to disable debug-on-error)

BEHAVE_DEBUG_ON_ERROR = False

def setup_debug_on_error(userdata):
    global BEHAVE_DEBUG_ON_ERROR
    BEHAVE_DEBUG_ON_ERROR = userdata.getbool("BEHAVE_DEBUG_ON_ERROR")

def before_all(context):
    setup_debug_on_error(context.config.userdata)

def after_step(context, step):
    if BEHAVE_DEBUG_ON_ERROR and step.status == "failed":
        # -- ENTER DEBUGGER: Zoom in on failure location.
        # NOTE: Use IPython debugger, same for pdb (basic python debugger).
        import ipdb
        ipdb.post_mortem(step.exc_traceback)

# https://behave.readthedocs.io/en/latest/usecase_flask.html
import os
import tempfile
from behave import fixture, use_fixture
# flaskr is the sample application we want to test
from zagua import create_app



@fixture
def flaskr_client(context, *args, **kwargs):
    app = create_app({'DATABASE': tempfile.mkstemp()})
    app.testing = True
    context.client = app.test_client()
    with app.app_context():
        #init_db()
        pass
    yield context.client
    # -- CLEANUP:
    #os.close(context.db)
    #os.unlink(app.config['DATABASE'])

def before_feature(context, feature):
    # -- HINT: Recreate a new flaskr client before each feature is executed.
    use_fixture(flaskr_client, context)
