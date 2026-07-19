locals {
  # HaGeZi's Pro DNS Blocklist - Ads, Affiliate, Tracking, Metrics, Telemetry,
  # Phishing, Malware, Scam, Fake, Cryptojacking, etc.
  # https://github.com/hagezi/dns-blocklists
  block_list_urls = [
    "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/pro.txt",
  ]
}
