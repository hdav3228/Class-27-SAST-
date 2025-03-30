# Pull the CodeQL Docker image
docker pull ghcr.io/github/codeql-cli-bundles/codeql-bundle:latest

# Create the CodeQL database
docker run --rm -v "$(pwd):/src" -w /src \
  ghcr.io/github/codeql-cli-bundles/codeql-bundle:latest \
  codeql database create --language=cpp --source-root=/src --command="make" vuln_db

# Run analysis on the database
docker run --rm -v "$(pwd):/src" -w /src \
  ghcr.io/github/codeql-cli-bundles/codeql-bundle:latest \
  codeql database analyze vuln_db --format=sarif-latest --output=results.sarif \
  cpp-security-and-quality.qls