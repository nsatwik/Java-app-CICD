# Java + AWS CodeBuild/CodeDeploy/CodePipeline Starter

This is a minimal Spring Boot project wired for AWS CI/CD. It builds a `artifact.zip`
that contains:
- `app.jar`
- `appspec.yml`
- `scripts/*` (lifecycle hooks & server controls)

## Local run

```bash
mvn spring-boot:run
# open http://localhost:8080/
```

## CodeBuild

- Uses `buildspec.yml` to build and produce `artifact.zip` at the root of the build.
- The `artifacts` section exposes `artifact.zip` to S3/CodePipeline automatically.

## CodeDeploy

- `appspec.yml` maps files to `/opt/myapp` and runs lifecycle hooks:
  - `BeforeInstall`: install Java and prepare directories
  - `AfterInstall`: set permissions
  - `ApplicationStart`: runs `scripts/server_start.sh`
  - `ApplicationStop`: runs `scripts/server_stop.sh`
  - `ValidateService`: runs `scripts/health_check.sh`

## CodePipeline (high-level)

1. **Source**: GitHub/CodeCommit
2. **Build**: CodeBuild project using this repo (outputs `artifact.zip`)
3. **Deploy**: CodeDeploy EC2/On-Premises application + deployment group

Make sure your EC2 instances have the CodeDeploy agent installed and an IAM instance profile
that allows S3 access and CloudWatch logs if needed.
