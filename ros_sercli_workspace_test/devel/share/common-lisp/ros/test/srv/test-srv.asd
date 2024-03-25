
(cl:in-package :asdf)

(defsystem "test-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "sercli" :depends-on ("_package_sercli"))
    (:file "_package_sercli" :depends-on ("_package"))
  ))