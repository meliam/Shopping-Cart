
FROM ubuntu:23.10
COPY . /shopping-cart
RUN make /shopping-cart
CMD python /shopping-cart/main.py