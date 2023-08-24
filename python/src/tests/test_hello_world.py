class TestHelloWorld:
    def test_lambda_handler(self):
        from ..hello_world.lambda_function import lambda_handler
        ret = lambda_handler()

        assert ret == 'hello world!'