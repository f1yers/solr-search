solr-search Cookbook
=======================
This cookbook deploys the solr application. Found [here](https://github.com/GannettDigital/chef-solr)

Requirements
------------
#### cookbooks
- 'solr'
- 'java'
- 'firewall'
- 'appdynamics'
- 'ark'
- 'iptables'
- 'logrotate'

Usage
-----
#### solr-search::default

Just include `solr-search` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[solr-search]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
PaaS-Optimization@gannett.com