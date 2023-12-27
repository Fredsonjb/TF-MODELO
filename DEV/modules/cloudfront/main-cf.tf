
# #creating Cloudfront distribution :
# resource "aws_cloudfront_distribution" "cf_dist" {
#   enabled = true
#   aliases = [var.domain_name]
#   origin {
#     domain_name = "awseb-AWSEB-1DS0QNDIC5VBY-1789377667.eu-central-1.elb.amazonaws.com"
#     origin_id   = "awseb-AWSEB-1DS0QNDIC5VBY"
#     custom_header {
#       name  = "x-custom-header"
#       value = "12345"
#     }
#     custom_origin_config {
#       http_port              = 80
#       https_port             = 443
#       origin_protocol_policy = "https-only"
#       origin_ssl_protocols   = ["TLSv1.2"]
#     }
#   }
#   ####################**** BEHAVIORS ****##################################################
#   #### **** Default **** ####
#   default_cache_behavior {
#     allowed_methods          = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
#     cached_methods           = ["GET", "HEAD"]
#     cache_policy_id          = aws_cloudfront_cache_policy.SitePD_wp-cache-policy-default.id
#     #origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
#     target_origin_id         = "awseb-AWSEB-1DS0QNDIC5VBY"
#     viewer_protocol_policy   = "redirect-to-https"

#   }
#   #### **** wp-includes **** ####
#   ordered_cache_behavior {
#     path_pattern     = "/wp-includes/*"
#     allowed_methods  = ["GET", "HEAD", "OPTIONS"]
#     cache_policy_id  = aws_cloudfront_cache_policy.SitePD_wp-cache-policy.id
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = "awseb-AWSEB-1DS0QNDIC5VBY"

#     min_ttl                = 1
#     default_ttl            = 86400
#     max_ttl                = 604800
#     compress               = true
#     viewer_protocol_policy = "redirect-to-https"
#   }
#   #### **** ajax **** ####
#   ordered_cache_behavior {
#     path_pattern     = "/wp-content/themes/pingodoce/ajax/*"
#     allowed_methods  = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = "awseb-AWSEB-1DS0QNDIC5VBY"

#     forwarded_values {
#       query_string = true

#       cookies {
#         forward = "all"
#       }
#     }

#     min_ttl                = 0
#     default_ttl            = 0
#     max_ttl                = 0
#     compress               = true
#     viewer_protocol_policy = "redirect-to-https"
#   }
#   #### **** wp-content **** ####
#   ordered_cache_behavior {
#     path_pattern     = "/wp-content/*"
#     allowed_methods  = ["GET", "HEAD", "OPTIONS"]
#     cache_policy_id  = aws_cloudfront_cache_policy.SitePD_wp-cache-policy.id
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = "awseb-AWSEB-1DS0QNDIC5VBY"
#     compress               = true
#     viewer_protocol_policy = "redirect-to-https"
#   }
#   #### **** /.../pesquisa/ **** ####
#   ordered_cache_behavior {
#     path_pattern     = "/receitas/pesquisa/*"
#     allowed_methods  = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = "awseb-AWSEB-1DS0QNDIC5VBY"

#     forwarded_values {
#       query_string = true

#       cookies {
#         forward = "all"
#       }
#     }

#     min_ttl                = 0
#     default_ttl            = 0
#     max_ttl                = 0
#     compress               = true
#     viewer_protocol_policy = "redirect-to-https"
#   }
#   #### **** /receitas/ **** ####
#   ordered_cache_behavior {
#     path_pattern     = "/receitas/*"
#     allowed_methods  = ["GET", "HEAD", "OPTIONS"]
#     cache_policy_id  = aws_cloudfront_cache_policy.SitePD_wp-cache-policy_RECEITAS.id
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = "awseb-AWSEB-1DS0QNDIC5VBY"
#     compress               = true
#     viewer_protocol_policy = "redirect-to-https"
#   }
#   #### **** /campanhas/ **** ####
#   ordered_cache_behavior {
#     path_pattern     = "/campanhas/*"
#     allowed_methods  = ["GET", "HEAD", "OPTIONS"]
#     cache_policy_id  = aws_cloudfront_cache_policy.SitePD_wp-cache-policy_CAMPANHAS.id
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = "awseb-AWSEB-1DS0QNDIC5VBY"
#     compress               = true
#     viewer_protocol_policy = "redirect-to-https"
#   }

#   ##################################################

#   restrictions {
#     geo_restriction {
#       restriction_type = "none"
#       #locations        = ["IN", "US", "CA", "PT"]
#     }
#   }

#   viewer_certificate {
#     # acm_certificate_arn      = "arn:aws:acm:us-east-1:878024869515:certificate/f43fb7ac-e82e-4e92-8f5b-a89430a11bbb"
#     # ssl_support_method       = "sni-only"
#     # minimum_protocol_version = "TLSv1.2_2018"
#   }
# }

######################## **** CACHE-POLICY **** ####################################
##### **** SitePD_wp-cache-policy **** #####

# resource "aws_cloudfront_cache_policy" "SitePD_wp-cache-policy" {
#   name        = "SitePD_wp-cache-policy"
#   comment     = "SitePD_wp-cache-policy"
#   default_ttl = 86400
#   max_ttl     = 604800
#   min_ttl     = 1
#   parameters_in_cache_key_and_forwarded_to_origin {
#     cookies_config {
#       cookie_behavior = "none"

#       #cookies {
#       #  items = ["example"]
#       #}

#     }
#     headers_config {
#       header_behavior = "whitelist"
#       headers {
#         items = ["Origin", "Access-Control-Request-Method", "Access-Control-Request-Headers", "Host"]
#       }
#     }
#     query_strings_config {
#       query_string_behavior = "none"

#       #query_strings {
#       #  items = ["example"]
#       #}

#     }
#     enable_accept_encoding_brotli = true
#     enable_accept_encoding_gzip   = true
#   }
# }
# ##### **** Cache Policy Receitas **** #####

# resource "aws_cloudfront_cache_policy" "SitePD_wp-cache-policy_RECEITAS" {
#   name        = "SitePD_wp-cache-policy_RECEITAS"
#   comment     = "SitePD_wp-cache-policy_RECEITAS"
#   default_ttl = 86400
#   max_ttl     = 604800
#   min_ttl     = 86400
#   parameters_in_cache_key_and_forwarded_to_origin {
#     cookies_config {
#       cookie_behavior = "none"

#       #cookies {
#       #  items = ["example"]
#       #}

#     }
#     headers_config {
#       header_behavior = "whitelist"
#       headers {
#         items = ["Origin", "Access-Control-Request-Method", "Access-Control-Request-Headers", "Host"]
#       }
#     }
#     query_strings_config {
#       query_string_behavior = "none"

#       #query_strings {
#       #  items = ["example"]
#       #}

#     }
#     enable_accept_encoding_brotli = true
#     enable_accept_encoding_gzip   = true
#   }
# }

# ##### **** Cache Policy Campanhas **** #####

# resource "aws_cloudfront_cache_policy" "SitePD_wp-cache-policy_CAMPANHAS" {
#   name        = "SitePD_wp-cache-policy_CAMPANHAS"
#   comment     = "SitePD_wp-cache-policy_CAMPANHAS"
#   default_ttl = 900
#   max_ttl     = 1200
#   min_ttl     = 900
#   parameters_in_cache_key_and_forwarded_to_origin {
#     cookies_config {
#       cookie_behavior = "none"

#       #cookies {
#       #  items = ["example"]
#       #}

#     }
#     headers_config {
#       header_behavior = "whitelist"
#       headers {
#         items = ["Origin", "Access-Control-Request-Method", "Access-Control-Request-Headers", "Host"]
#       }
#     }
#     query_strings_config {
#       query_string_behavior = "none"

#       #query_strings {
#       #  items = ["example"]
#       #}

#     }
#     enable_accept_encoding_brotli = true
#     enable_accept_encoding_gzip   = true
#   }
# }
#### *** policy-default *** ####
# resource "aws_cloudfront_cache_policy" "SitePD_wp-cache-policy-default" {
#   name        = "SitePD_wp-cache-policy-default"
#   comment     = "SitePD_wp-cache-policy-default"
#   default_ttl = 300
#   max_ttl     = 31536000
#   min_ttl     = 0
#   parameters_in_cache_key_and_forwarded_to_origin {
#     cookies_config {
#       cookie_behavior = "whitelist"

#       cookies {
#         items = ["comment_author_*", "comment_author_email_*", "wordpress_test_cookie", 
#         "comment_author_url_*", "wordpress_*", "wordpress_logged_in_*", "wp-settings-*"]

#       }

#     }
#     headers_config {
#       header_behavior = "whitelist"
#       headers {
#         items = ["Origin", "Host"]
#       }
#     }
#     query_strings_config {
#       query_string_behavior = "all"

#       #query_strings {
#       #  items = ["example"]
#       #}

#     }
#     enable_accept_encoding_brotli = true
#     enable_accept_encoding_gzip   = true
#   }
# }
