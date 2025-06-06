;; Test type definitions

(module
  (type (func))
  (type $t (func))

  (type (func (param i32)))
  (type (func (param $x i32)))
  (type (func (result i32)))
  (type (func (param i32) (result i32)))
  (type (func (param $x i32) (result i32)))

  (type (func (param f32 f64)))
  ;; W2C2: No support for functions with multiple return values
  ;; (type (func (result i64 f32)))
  ;; (type (func (param i32 i64) (result f32 f64)))

  (type (func (param f32) (param f64)))
  (type (func (param $x f32) (param f64)))
  (type (func (param f32) (param $y f64)))
  (type (func (param $x f32) (param $y f64)))
  ;; W2C2: No support for functions with multiple return values
  ;; (type (func (result i64) (result f32)))
  ;; (type (func (param i32) (param i64) (result f32) (result f64)))
  ;; (type (func (param $x i32) (param $y i64) (result f32) (result f64)))

  (type (func (param f32 f64) (param $x i32) (param f64 i32 i32)))
  ;; W2C2: No support for functions with multiple return values
  ;; (type (func (result i64 i64 f32) (result f32 i32)))
  ;; (type
  ;;   (func (param i32 i32) (param i64 i32) (result f32 f64) (result f64 i32))
  ;; )

  (type (func (param) (param $x f32) (param) (param) (param f64 i32) (param)))
  ;; W2C2: No support for functions with multiple return values
  ;; (type
  ;;   (func (result) (result) (result i64 i64) (result) (result f32) (result))
  ;; )
  ;; (type
  ;;   (func
  ;;     (param i32 i32) (param i64 i32) (param) (param $x i32) (param)
  ;;     (result) (result f32 f64) (result f64 i32) (result)
  ;;   )
  ;; )
)

(assert_malformed
  (module quote "(type (func (result i32) (param i32)))")
  "unexpected token"
)
(assert_malformed
  (module quote "(type (func (result $x i32)))")
  "unexpected token"
)
