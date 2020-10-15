#!/bin/bash
pip wheel --prefer-binary --wheel-dir=wheelhouse --extra-index-url https://www.piwheels.org/simple,https://pypi.org/simple $@
