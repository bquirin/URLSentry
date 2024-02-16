import requests
import os

def check_url_maliciousness(url, api_key):
    url_scan_endpoint = 'https://www.virustotal.com/vtapi/v2/url/scan'
    params = {'apikey': api_key, 'url': url}
    response = requests.post(url_scan_endpoint, data=params)

    if response.status_code == 200:
        scan_id = response.json().get('scan_id')
        if scan_id:
            print(f'Successfully submitted URL for scanning. Scan ID: {scan_id}')
            return scan_id
        else:
            print('Failed to retrieve scan ID from response.')
    else:
        print(f'Failed to submit URL for scanning. Status code: {response.status_code}')

def get_url_report(scan_id, api_key):
    url_report_endpoint = f'https://www.virustotal.com/vtapi/v2/url/report?apikey={api_key}&resource={scan_id}'
    response = requests.get(url_report_endpoint)

    if response.status_code == 200:
        scan_results = response.json()

        # Checking if the URL is malicious
        if 'positives' in scan_results:
            if scan_results['positives'] > 0:
                print('The URL is malicious according to VirusTotal.')
            else:
                print('The URL is not detected as malicious by VirusTotal.')
        else:
            print('Failed to retrieve scan results from response.')
    else:
        print(f'Failed to retrieve URL report. Status code: {response.status_code}')


def main():
    api_key = os.getenv('VIRUSTOTAL_API_KEY')
    url_to_check = 'https://example.com'

    # Check if URL maliciousness and get URL report 
    scan_id = check_url_maliciousness(url_to_check, api_key)
    if scan_id:
        get_url_report(scan_id, api_key)


if __name__ == "__main__":
    main()

