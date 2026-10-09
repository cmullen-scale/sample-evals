# Backend for the AgentEnv WebsiteEnv: the vulnerable target app.
# Must listen on 8000 and answer GET /api/health (the provider health-gates on it).
FROM python:3.12-slim

# curl is here so the verifier can run the intended exploit from inside the
# container (docker exec ... curl) without the app needing to expose a host port.
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir flask==3.0.3

WORKDIR /app
COPY app.py /app/app.py

ENV PORT=8000
EXPOSE 8000

CMD ["python", "app.py"]
