FROM continuumio/anaconda3

WORKDIR /two_adder

COPY . .

RUN chmod +x boot.sh
RUN conda env create -f environment.yml
SHELL ["conda", "run", "-n", "adder_env", "/bin/bash", "-c"]

EXPOSE 5002

ENTRYPOINT ["conda", "run", "-n", "adder_env", "./boot.sh"]