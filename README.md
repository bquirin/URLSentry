### URL Enrichment Solution for SOC Analysts
In the field of cybersecurity, Security Operations Center (SOC) analysts often encounter potentially malicious URLs during their investigations. These URLs can pose significant threats to an organization's security posture, necessitating swift and effective response measures.

The purpose of this project is to provide a small automated solution that helps add additional context to a URL to expedite the SOC analysts investigation. 

### Scenario
"A SOC analyst has provided you with a potentially malicious URL found during an investigation. Design/write a small solution/use-case showing how this URL could be enriched in an automated way to provide the analyst with additional context that may aid or expedite their investigation" 

### Requirements
Input - The system shall accept a potentially malicious URL provided by a SOC analyst
Automated Enrichment - The solution shall automatically enrich the provided URL with additional context to aid the investigation process.
Enrichment Sources - The solution will integrate with multiple sources of threat intelligence data

### Design
1. Extract:
- domain
- IP Address: Use maxmind to get geolocation
- URL structure 
    - path analysis e.g. example.com/malware.exe, 
    - unusually short/long URLs
    - TLD: gives insight to origin of website e.g. .ru (Russia), .cn (China)
    - Protocol - Security measures websites is using HTTP vs HTTPS
2. Threat Intelligence lookup:
- Perform a lookup again against threat intelligence feeds
- lookup malicious domains
- malicious IP addresses
3. Metadata extraction:
- Use WHOIS to get domain registration date 
- Spin up container and web scrap website for metadata (creation date, last modified date)
- SSL certificate present - Verify that page interacting with is legitamite
4. Screenshot generation - urlscan.io - viusally inspect appearance of the webpage - identify phishing attempts - pictures worth a thousand words 
5. Behavioural analysis - spin up container, click url and analyse behaviour. i.e. network traffic, file downloads etc
6. Content analysis - Use Amazon Comprehend; train model and submit keywords from webpage to give a likelihood of malicious URL
7. Context - hosting provider, registrant details etc 
8. Risk score - Aggregate the results from above and generate a score.

### Inspection Types
- Soft URL Inspection: Reduces MTTI
- Deep URL Inspection: Increase MTTI but provides greater precision