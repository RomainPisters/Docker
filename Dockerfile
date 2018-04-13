FROM centos:latest

RUN yum -y update && \ 
    yum groupinstall -y development && \ 
    yum install -y \ 
    bzip2-devel \ 
    git \ 
    hostname \ 
    openssl \ 
    openssl-devel \ 
    sqlite-devel \ 
    sudo \ 
    tar \ 
    wget \ 
    zlib-dev \
    unzip

# Install python2.7.14 
RUN cd /tmp && \ 
    wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tgz && \ 
    tar xvfz Python-2.7.14.tgz && \ 
    cd Python-2.7.14 && \ 
    ./configure --prefix=/usr/local && \ 
    make && \ 
    make altinstall

# symlink python2.7 to python 
RUN ln -s /usr/local/bin/python2.7 /usr/local/bin/python

# Install setuptools + pip + virtualenv 
RUN cd /tmp && \ 
wget --no-check-certificate https://pypi.python.org/packages/72/c2/c09362ab29338413ab687b47dab03bab4a792e2bbb727a1eb5e0a88e3b86/setuptools-39.0.1.zip#md5=75310b72ca0ab4e673bf7679f69d7a62 && \ 
unzip setuptools-39.0.1.zip && \ 
cd setuptools-39.0.1 && \ 
python2.7 setup.py install && \ 
curl https://bootstrap.pypa.io/get-pip.py | python2.7 - && \ 
pip install pipenv