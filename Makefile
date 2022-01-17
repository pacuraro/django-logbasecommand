.PHONY: style
style:
	black --target-version=py36 \
	      --line-length=120 \
		  --skip-string-normalization \
		  logbasecommand testapp setup.py

.PHONY: style_check
style_check:
	black --target-version=py36 \
	      --line-length=120 \
		  --skip-string-normalization \
		  --check \
		  logbasecommand testapp setup.py

test:
	testapp/manage.py test $${TEST_ARGS:-tests}

coverage:
	PYTHONPATH="testapp" \
		python -b -W always -m coverage run testapp/manage.py test $${TEST_ARGS:-tests}
	coverage report
