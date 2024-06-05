FROM python:3.9-slim-bullseye

RUN apt update
RUN apt install gcc git -y

RUN pip install --no-cache-dir cython
RUN pip install --no-cache-dir git+https://github.com/bmoscon/cryptofeed@main
RUN pip install --no-cache-dir redis
RUN pip install --no-cache-dir pymongo[srv]
RUN pip install --no-cache-dir motor
RUN pip install --no-cache-dir asyncpg

COPY cryptostore.py /cryptostore.py

CMD ["/cryptostore.py"]
ENTRYPOINT ["python"]
