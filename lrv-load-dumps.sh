./bin/django.sh dumpdata --indent 4 --natural-primary rules.rulecategory > backend/apps/rules/fixtures/rule_categories.json
./bin/django.sh dumpdata --indent 4 --natural-primary rules.ruletemplate > backend/apps/rules/fixtures/rule_templates.json
./bin/django.sh dumpdata --indent 4 --natural-primary rules.ruletemplatedataset > backend/apps/rules/fixtures/rule_templates_datasets.json
./bin/django.sh dumpdata --indent 4 --natural-primary rules.ruletemplatetest > backend/apps/rules/fixtures/rule_templates_tests.json