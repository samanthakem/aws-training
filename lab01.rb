#!/usr/bin/env ruby

require 'rubygems'
require 'aws-sdk-core'
require 'aws-sdk'

def getAllBuckets
  begin
    s3 = Aws::S3::Client.new(region: ENV['AWS_REGION'])
    no_of_buckets = s3.list_buckets.buckets.length

    puts ("===============================================================")
    puts ("Developing on AWS Lab 1 - Ruby SDK! Ready, Set, Go!")
    puts ("===============================================================")
    puts ("Number of buckets: #{no_of_buckets}")
  rescue Aws::Errors::MissingCredentialsError => e
    puts "No AWS Credentials file found or credentials were invalid"
  rescue Exception => e
    puts e
  end
end

if __FILE__ == $0
  getAllBuckets()
end
