FROM centos/ruby-22-centos7
LABEL io.k8s.description="Ruby with kubectl" \
      io.k8s.display-name="pitc-ruby-kubectl"

ENV KUBE_LATEST_VERSION="v1.9.2"

# installation

USER root

RUN yum -y install epel-release && \
    yum update -y && \
    INSTALL_PKGS="curl" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    yum clean all -y

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl

# installed

USER 1001

ENTRYPOINT ["kubectl"]
CMD ["help"]
