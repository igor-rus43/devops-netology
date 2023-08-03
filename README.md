# devops-netology
first rewrite

В terraform/.gitignore сделаны исключения для:
    1. любых каталогов в директории содержащих папку с именем .terraform
    2. файлов с расширениями: *.tfstate,*.tfvars
    3. для файлов с именем crash.log начинающихся на crash.(любые символы).log
    4. отдельные файлы override.tf, override.tf.json, .terraformrc, terraform.rc
    5. файлов заканчивающихся на *_override.tf, *_override.tf.json