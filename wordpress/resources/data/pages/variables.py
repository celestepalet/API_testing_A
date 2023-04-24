ignore = ['permalink_template', '_links', 'generated_slug', 'password', ('title', 'raw'), ('content', 'raw'),
          ('content', 'block_version'), ('excerpt', 'raw'), ('guid', 'raw')]

bad_author_response = {'code': 'rest_invalid_author', 'message': 'Invalid author ID.', 'data': {'status': 400}}
bad_ping_status_response = {'code': 'rest_invalid_param', 'message': 'Invalid parameter(s): ping_status',
                            'data': {'status': 400,
                                     'params': {'ping_status': 'ping_status is not one of open and closed.'},
                                     'details': {'ping_status': {'code': 'rest_not_in_enum',
                                     'message': 'ping_status is not one of open and closed.', 'data': None}}}}

bad_comment_status_response = {'code': 'rest_invalid_param', 'message': 'Invalid parameter(s): comment_status',
                               'data': {'status': 400,
                                        'params': {'comment_status': 'comment_status is not one of open and closed.'},
                                        'details': {'comment_status': {'code': 'rest_not_in_enum',
                                        'message': 'comment_status is not one of open and closed.', 'data': None}}}}

delete_same_page = {'code': 'rest_already_trashed', 'message': 'The post has already been deleted.',
                    'data': {'status': 410}}
