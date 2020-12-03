{:user {:signing {:gpg-key "0B291441"}

        :datomic {:install-location "resources/datomic/datomic-pro"}

        :plugins [[cider/cider-nrepl "0.10.0"]
                  [refactor-nrepl "1.1.0"]
                                        ;[refactor-nrepl "2.0.0-SNAPSHOT"]
                  [lein-datomic "0.2.0"]
                  [lein-try "0.4.3"]
                  [lein-midje "3.1.3"]
                  [chestnut/lein-template "0.7.0" :exclusions [org.clojure/core.cache]]
                  [lein-ancient "0.6.5"]
                  [lein-bikeshed "0.2.0"]
                  [jonase/eastwood "0.2.3" :exclusions [org.clojure/clojure]]
                  [lein-kibit "0.1.2"]
                  [lein-cloverage "1.0.6"]]

        :dependencies [[org.clojure/tools.namespace "0.2.11"]
                       [org.clojure/tools.nrepl "0.2.12"]
                       [acyclic/squiggly-clojure "0.1.4"]
                       ;^:replace [org.clojure/tools.nrepl "0.2.12"]
                       ;[jonase/eastwood "0.2.3" :exclusions [org.clojure/clojure]]
                       [org.clojure/core.typed "0.3.18"]
                       [slamhound "1.5.5"]]

        ;; :env {:squiggly {:checkers [:eastwood]
        ;;                  :eastwood-exclude-linters [:unlimited-use]}}

        :jvm-opts ["-XX:MaxPermSize=128M"] ;; for refactor-nrepl.

        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
