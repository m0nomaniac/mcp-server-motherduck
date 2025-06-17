FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Install uv (Python package/runtime manager)
RUN pip install uv

# Copy all code into the image
COPY . .

# Expose port for the server
EXPOSE 8000

# Set your MotherDuck token as an environment variable
# (or you can pass it at runtime instead)
ENV MOTHERDUCK_TOKEN=your_motherduck_token_here

# Run the MCP server, binding to 0.0.0.0 for Docker networking
CMD ["uvx", "mcp-server-motherduck", "--db-path", "md:", "--motherduck-token", "your_motherduck_token_here", "--host", "0.0.0.0", "--port", "8000"]
