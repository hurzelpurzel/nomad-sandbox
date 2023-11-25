# Nomad pack

Nomad Pack seems to be "helm" for nomad. It is in preview 

https://github.com/hashicorp/nomad-pack


Community packs from
https://github.com/hashicorp/nomad-pack-community-registry/tree/main


# Add registry
./nomad-pack registry add default https://github.com/hashicorp/nomad-pack-community-registry


# Run hello world
nomad-pack run hello_world --var message="Hola Mundo!" --parser-v1

# Gitops Operator
https://github.com/jonasvinther/nomad-gitops-operator