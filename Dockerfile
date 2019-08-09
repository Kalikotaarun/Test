login -u $NUSERNAME -p $NPASSWORD ec2-13-59-73-13.us-east-2.compute.amazonaws.com:8083/repository/devsecopsrepo/
docker pull $docker_repo/winmsbuildv1

set +e
docker stop -t 0 winfortifysca
docker rm winfortifysca
docker rmi $docker_repo/winmsbuildv1
docker system prune -f
set -e

docker run --name winfortifysca -v "$WORKSPACE":/workspace -t -d $docker_repo/winmsbuildv1 -language dotnet -projectName dotnet -buildTool msbuild -buildFile /workspace/ArunVSTSApp.sln -projectRoot /workspace -jobName "$JOB_NAME" -buildNumber "$BUILD_NUMBER"
docker stop -t 0 winfortifysca
docker rm winfortifysca
docker rmi $docker_repo/winmsbuildv1

# End of Fortify SCA Test
docker system prune -f
