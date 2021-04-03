FROM jupyter/scipy-notebook

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install ipysheet
RUN pip install --no-cache-dir -r requirements.txt
RUN jupyter labextension install ipysheet
RUN jupyter nbextension enable --py --sys-prefix ipysheet
RUN pip install jupyter_interval_widget
RUN jupyter nbextension enable --py --sys-prefix jupyter_interval_widget
RUN pip install voila

ADD . .

CMD ["voila", "--no-browser", "--enable_nbextensions=True"]