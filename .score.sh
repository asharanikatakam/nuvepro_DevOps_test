#!/bin/sh
pass=0
fail=0
TEST_1=$(find /home/user/.jenkins/secrets/initialAdminPassword | wc -l)
TEST_2=$(grep -io "SUCCESS" /home/user/.jenkins/jobs/JenkinsDockerDemo/builds/lastSuccessfulBuild/build.xml | wc -l)
TEST_3=$(find /home/user/.jenkins/workspace/JenkinsDeployWar/target/surefire-reports/*.xml | wc -l)
TEST_4=$(grep -i -e "myimage" -e "tag1" -e "build" -e "run" /home/user/.jenkins/jobs/JenkinsDockerDemo/config.xml | wc -l)
TEST_5=$(grep -o -e "SUCCESS" /home/user/.jenkins/jobs/JenkinsDockerDemo/builds/lastSuccessfulBuild/log | wc -l)
TEST_6=$((curl https://localhost:8000 | grep "successfully") | wc -l)

if [ "$TEST_1" -eq 1 ]
then ((pass++))
else
    ((fail++))
fi;
if [ "$TEST_2" -eq 1 ]
then ((pass++))
else
    ((fail++))
fi;
if [ "$TEST_3" -ge 1 ]
then ((pass++))
else
    ((fail++))
fi;
if [ "$TEST_4" -ge 4 ]
then ((pass++))
else
    ((fail++))
fi;
if [ "$TEST_5" -ge 1 ]
then ((pass++))
else
    ((fail++))
fi;
if [ "$TEST_6" -ge 1 ]
then ((pass++))
else
    ((fail++))
fi;

echo "Total testcase: 6"
echo "Total testcase passed: $pass"
echo "Total testcase fail: $fail"
echo "total score: $(( ($pass * 100) / 6))"