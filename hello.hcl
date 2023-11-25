job "hello_world" {

  datacenters = ["dc1"]
  type        = "service"

  group "app" {
    count = 2

    network {
      port "http" {
        to = 8000
      }
    }


    service {
      name = "webapp"
      tags = ["urlprefix-/", "traefik.enable=true", "traefik.http.routers.http.rule=Path(`/`)"]
      port = "http"

      check {
        name     = "alive"
        type     = "http"
        path     = "/"
        interval = "10s"
        timeout  = "2s"
      }
    }


    restart {
      attempts = 2
      interval = "30m"
      delay    = "15s"
      mode     = "fail"
    }

    task "server" {
      driver = "podman"

      config {
        image = "mnomitch/hello_world_server"
        ports = ["http"]
      }

      env {
        MESSAGE = "hallo"
      }
    }
  }
}

