#
# @validation.py Copyright (c) 2023 Jalasoft.
# 2643 Av Melchor Perez de Olguin, Colquiri Sud, Cochabamba, Bolivia.
#
# All rights reserved.
#
# This software is the confidential and proprietary information of
# Jalasoft, ("Confidential Information"). You shall not
# disclose such Confidential Information and shall use it only in
# accordance with the terms of the license agreement you entered into
# with Jalasoft.
#

class Validation:
    """Validates a request response"""

    def validate_response_status(self, response, exp_status=200, **kwargs):
        """Validates the status code of a request"""
        assert response.status_code == exp_status, 'Actual response is %s, expect: %s' % \
                                                   (response.status_code, int(exp_status))
