# Publish PowerShell Script

This is a GitHub action to publish a PowerShell script to the [PowerShell Gallery](https://powershellgallery.com).

Your script should be a single file located within your GitHub repository.

```yaml
name: "Publish"

on:
  release:
    types: [published]

jobs:
  publish:
    name: Publish
    runs-on: ubuntu-latest
    steps:
      - uses: "actions/checkout@main"
      - name: Publish to PSGallery
        uses: jcwillox/action-publish-powershell-script@main
        with:
          name: lptstr-winfetch  # use an alternate name as 'winfetch' is taken
          path: winfetch.ps1
          nuget_api_key: ${{ secrets.PSGALLERY_KEY }}
```


