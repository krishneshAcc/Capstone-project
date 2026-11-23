# Project 22 - S3 Log Archive with Lifecycle

## Objective
Archive log files in Amazon S3 and reduce storage costs by automatically expiring archived logs after 30 days.

## AWS Service
- Amazon S3

## Bucket Details
- **Bucket Name:** `azltt0222435e27-project22-log-archive-590507089733-20261123`
- **Region:** `ap-south-1` (Mumbai)

## Uploaded Log Files

The following log files were uploaded to the `logs/` prefix:

- `logs/application.log`
- `logs/auth.log`
- `logs/system.log`

## Lifecycle Rule

- **Rule Name:** `Expire-Archived-Logs-After-30-Days`
- **Status:** Enabled
- **Prefix:** `logs/`
- **Expiration:** 30 days

## Lifecycle Configuration

The lifecycle configuration is stored in `lifecycle-rule.json`.

## Verification

The following AWS CLI commands were used to verify the configuration:

```bash
aws s3 ls s3://azltt0222435e27-project22-log-archive-590507089733-20261123/ --recursive

aws s3api get-bucket-lifecycle-configuration \
  --bucket azltt0222435e27-project22-log-archive-590507089733-20261123
