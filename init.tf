provider "aws" {
	region = "ap-northeast-2" # Default region
}

# Save tfstate to S3 bucket
resource "aws_s3_bucket" "tfstate" {
	bucket = "tf-practice-tfstate"
	versioning {
		enabled = true
	}
}

resource "aws_dynamodb_table" "terrafrom_state_lock" {
	name = "terraform-lock"
	hash_key = "LOCK-ID"
	billing_mode = "PAY_PER_REQUEST"
	
	attribute {
		name = "LOCK-ID"
		type = "S"
	}
}
