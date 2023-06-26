#!/usr/bin/env python
import os
import yaml


if __name__ == '__main__':
    
    warehouse_config = {
        'type': 'databricks',
        'catalog': 'dpg_prod',
        'schema': 'analytics',
        'host': os.getenv('DB_HOST'),
        'http_path': os.getenv('DB_HTTP_PATH'),
        'token': os.getenv('DB_TOKEN'),
        'threads': 8,
    }

    target_name = 'prod'
    
    profile_config = {
        'dpg_databricks': {
            'outputs': {
                target_name: warehouse_config,
            },
            'target': target_name,
        },
    }

    print(yaml.dump(profile_config))
