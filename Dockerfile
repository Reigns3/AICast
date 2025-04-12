FROM python:3.11-slim

WORKDIR /app

# Copy only requirements first to leverage caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy only necessary files
COPY app.py .
COPY models/convlstm_final_v4.h5 models/
COPY data/X_test_small.npy data/
COPY data/scaler.pkl data/
COPY Dataset/final_weather_data.nc Dataset/

ENV PORT 5000

CMD ["python", "app.py"]
