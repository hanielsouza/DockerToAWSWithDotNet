for i in $(find /home/database/ -name "*.sql" | sort --version-sort); do
  mysql -u docker -p'docker' docker_to_aws_with_dotnet < "$i"
done