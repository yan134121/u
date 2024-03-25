;; Auto-generated. Do not edit!


(when (boundp 'test::sercli)
  (if (not (find-package "TEST"))
    (make-package "TEST"))
  (shadow 'sercli (find-package "TEST")))
(unless (find-package "TEST::SERCLI")
  (make-package "TEST::SERCLI"))
(unless (find-package "TEST::SERCLIREQUEST")
  (make-package "TEST::SERCLIREQUEST"))
(unless (find-package "TEST::SERCLIRESPONSE")
  (make-package "TEST::SERCLIRESPONSE"))

(in-package "ROS")





(defclass test::sercliRequest
  :super ros::object
  :slots (_num1 _num2 ))

(defmethod test::sercliRequest
  (:init
   (&key
    ((:num1 __num1) 0)
    ((:num2 __num2) 0)
    )
   (send-super :init)
   (setq _num1 (round __num1))
   (setq _num2 (round __num2))
   self)
  (:num1
   (&optional __num1)
   (if __num1 (setq _num1 __num1)) _num1)
  (:num2
   (&optional __num2)
   (if __num2 (setq _num2 __num2)) _num2)
  (:serialization-length
   ()
   (+
    ;; int32 _num1
    4
    ;; int32 _num2
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _num1
       (write-long _num1 s)
     ;; int32 _num2
       (write-long _num2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _num1
     (setq _num1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _num2
     (setq _num2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass test::sercliResponse
  :super ros::object
  :slots (_sum ))

(defmethod test::sercliResponse
  (:init
   (&key
    ((:sum __sum) 0)
    )
   (send-super :init)
   (setq _sum (round __sum))
   self)
  (:sum
   (&optional __sum)
   (if __sum (setq _sum __sum)) _sum)
  (:serialization-length
   ()
   (+
    ;; int32 _sum
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _sum
       (write-long _sum s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _sum
     (setq _sum (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass test::sercli
  :super ros::object
  :slots ())

(setf (get test::sercli :md5sum-) "4781436a0c2affec8025955a6041e481")
(setf (get test::sercli :datatype-) "test/sercli")
(setf (get test::sercli :request) test::sercliRequest)
(setf (get test::sercli :response) test::sercliResponse)

(defmethod test::sercliRequest
  (:response () (instance test::sercliResponse :init)))

(setf (get test::sercliRequest :md5sum-) "4781436a0c2affec8025955a6041e481")
(setf (get test::sercliRequest :datatype-) "test/sercliRequest")
(setf (get test::sercliRequest :definition-)
      "# 客户端请求时发送的两个数字
int32 num1
int32 num2
---
# 服务器响应发送的数据
int32 sum

")

(setf (get test::sercliResponse :md5sum-) "4781436a0c2affec8025955a6041e481")
(setf (get test::sercliResponse :datatype-) "test/sercliResponse")
(setf (get test::sercliResponse :definition-)
      "# 客户端请求时发送的两个数字
int32 num1
int32 num2
---
# 服务器响应发送的数据
int32 sum

")



(provide :test/sercli "4781436a0c2affec8025955a6041e481")


