resource "aws_sns_topic" "test_sns" {
  name = "YASH"
}

resource "aws_sns_topic_subscription" "name" {
  endpoint = "suresh.akidev@gmail.com"
  protocol = "email"
  topic_arn = aws_sns_topic.test_sns.arn
}