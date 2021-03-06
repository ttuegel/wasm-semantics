;; Test all the f64 comparison operators on major boundary values and all
;; special values.

(module
  (func (export "eq") (param $x f64) (param $y f64) (result i32) (f64.eq (local.get $x) (local.get $y)))
  (func (export "ne") (param $x f64) (param $y f64) (result i32) (f64.ne (local.get $x) (local.get $y)))
  (func (export "lt") (param $x f64) (param $y f64) (result i32) (f64.lt (local.get $x) (local.get $y)))
  (func (export "le") (param $x f64) (param $y f64) (result i32) (f64.le (local.get $x) (local.get $y)))
  (func (export "gt") (param $x f64) (param $y f64) (result i32) (f64.gt (local.get $x) (local.get $y)))
  (func (export "ge") (param $x f64) (param $y f64) (result i32) (f64.ge (local.get $x) (local.get $y)))
)

(assert_return (invoke "eq" (f64.const -0.0) (f64.const -0.0)) (i32.const 1))
(assert_return (invoke "eq" (f64.const -0.0) (f64.const 0.0)) (i32.const 1))
(assert_return (invoke "eq" (f64.const 0.0) (f64.const -0.0)) (i32.const 1))
(assert_return (invoke "eq" (f64.const 0.0) (f64.const 0.0)) (i32.const 1))
(assert_return (invoke "eq" (f64.const -0.0) (f64.const -4.94065645841e-324)) (i32.const 0))
(assert_return (invoke "eq" (f64.const -0.0) (f64.const 4.94065645841e-324)) (i32.const 0))
(assert_return (invoke "eq" (f64.const 0.0) (f64.const -4.94065645841e-324)) (i32.const 0))
(assert_return (invoke "eq" (f64.const 0.0) (f64.const 4.94065645841e-324)) (i32.const 0))
(assert_return (invoke "eq" (f64.const -4.94065645841e-324) (f64.const -4.94065645841e-324)) (i32.const 1))
(assert_return (invoke "eq" (f64.const -4.94065645841e-324) (f64.const 4.94065645841e-324)) (i32.const 0))
(assert_return (invoke "eq" (f64.const 4.94065645841e-324) (f64.const -4.94065645841e-324)) (i32.const 0))
(assert_return (invoke "eq" (f64.const 4.94065645841e-324) (f64.const 4.94065645841e-324)) (i32.const 1))
(assert_return (invoke "ne" (f64.const -0.0) (f64.const 2.22507385851e-308)) (i32.const 1))
(assert_return (invoke "ne" (f64.const 0.0) (f64.const -2.22507385851e-308)) (i32.const 1))
(assert_return (invoke "ne" (f64.const 0.0) (f64.const 2.22507385851e-308)) (i32.const 1))
(assert_return (invoke "ne" (f64.const -0.0) (f64.const -0.5)) (i32.const 1))
(assert_return (invoke "ne" (f64.const -0.0) (f64.const 0.5)) (i32.const 1))
(assert_return (invoke "ne" (f64.const 0.0) (f64.const -0.5)) (i32.const 1))
(assert_return (invoke "ne" (f64.const 0.0) (f64.const 0.5)) (i32.const 1))
(assert_return (invoke "ne" (f64.const -0.0) (f64.const -1.0)) (i32.const 1))
(assert_return (invoke "ne" (f64.const -0.0) (f64.const 1.0)) (i32.const 1))
(assert_return (invoke "ne" (f64.const NaN) (f64.const -0.0)) (i32.const 1))
(assert_return (invoke "lt" (f64.const -0.0) (f64.const -0.0)) (i32.const 0))
(assert_return (invoke "lt" (f64.const -0.0) (f64.const 0.0)) (i32.const 0))
(assert_return (invoke "lt" (f64.const 0.0) (f64.const -0.0)) (i32.const 0))
(assert_return (invoke "lt" (f64.const 0.0) (f64.const 0.0)) (i32.const 0))
(assert_return (invoke "lt" (f64.const -0.0) (f64.const -4.94065645841e-324)) (i32.const 0))
(assert_return (invoke "lt" (f64.const -0.0) (f64.const 4.94065645841e-324)) (i32.const 1))
(assert_return (invoke "lt" (f64.const 0.0) (f64.const -4.94065645841e-324)) (i32.const 0))
(assert_return (invoke "lt" (f64.const 0.0) (f64.const 4.94065645841e-324)) (i32.const 1))
(assert_return (invoke "lt" (f64.const -1.79769313486e+308) (f64.const 6.28318530718)) (i32.const 1))
(assert_return (invoke "lt" (f64.const 1.79769313486e+308) (f64.const -6.28318530718)) (i32.const 0))
(assert_return (invoke "lt" (f64.const 1.79769313486e+308) (f64.const 6.28318530718)) (i32.const 0))
(assert_return (invoke "lt" (f64.const -1.79769313486e+308) (f64.const -1.79769313486e+308)) (i32.const 0))
(assert_return (invoke "lt" (f64.const -1.79769313486e+308) (f64.const 1.79769313486e+308)) (i32.const 1))
(assert_return (invoke "lt" (f64.const 1.79769313486e+308) (f64.const -1.79769313486e+308)) (i32.const 0))
(assert_return (invoke "lt" (f64.const 1.79769313486e+308) (f64.const 1.79769313486e+308)) (i32.const 0))
(assert_return (invoke "lt" (f64.const -1.79769313486e+308) (f64.const -Infinity)) (i32.const 0))
(assert_return (invoke "lt" (f64.const -1.79769313486e+308) (f64.const Infinity)) (i32.const 1))
(assert_return (invoke "lt" (f64.const 1.79769313486e+308) (f64.const -Infinity)) (i32.const 0))
(assert_return (invoke "lt" (f64.const 1.79769313486e+308) (f64.const Infinity)) (i32.const 1))
;; (assert_return (invoke "le" (f64.const -0x0.0000000000001p-1022) (f64.const -nan)) (i32.const 0))
;; (assert_return (invoke "le" (f64.const -0x0.0000000000001p-1022) (f64.const -nan:0x4000000000000)) (i32.const 0))
(assert_return (invoke "le" (f64.const -4.94065645841e-324) (f64.const NaN)) (i32.const 0))
;; (assert_return (invoke "le" (f64.const -0x0.0000000000001p-1022) (f64.const nan:0x4000000000000)) (i32.const 0))
;; (assert_return (invoke "le" (f64.const 0x0.0000000000001p-1022) (f64.const -nan)) (i32.const 0))
;; (assert_return (invoke "le" (f64.const 0x0.0000000000001p-1022) (f64.const -nan:0x4000000000000)) (i32.const 0))
(assert_return (invoke "le" (f64.const 4.94065645841e-324) (f64.const NaN)) (i32.const 0))
(assert_return (invoke "gt" (f64.const -Infinity) (f64.const 1.0)) (i32.const 0))
(assert_return (invoke "gt" (f64.const Infinity) (f64.const -1.0)) (i32.const 1))
(assert_return (invoke "gt" (f64.const Infinity) (f64.const 1.0)) (i32.const 1))
(assert_return (invoke "gt" (f64.const -Infinity) (f64.const -6.28318530718)) (i32.const 0))
(assert_return (invoke "gt" (f64.const -Infinity) (f64.const 6.28318530718)) (i32.const 0))
(assert_return (invoke "gt" (f64.const Infinity) (f64.const -6.28318530718)) (i32.const 1))
(assert_return (invoke "gt" (f64.const Infinity) (f64.const 6.28318530718)) (i32.const 1))
(assert_return (invoke "ge" (f64.const -0.0) (f64.const -0.0)) (i32.const 1))
(assert_return (invoke "ge" (f64.const -0.0) (f64.const 0.0)) (i32.const 1))
(assert_return (invoke "ge" (f64.const 0.0) (f64.const -0.0)) (i32.const 1))
(assert_return (invoke "ge" (f64.const 0.0) (f64.const 0.0)) (i32.const 1))
(assert_return (invoke "ge" (f64.const -Infinity) (f64.const 0.0)) (i32.const 0))
(assert_return (invoke "ge" (f64.const Infinity) (f64.const -0.0)) (i32.const 1))
(assert_return (invoke "ge" (f64.const Infinity) (f64.const 0.0)) (i32.const 1))

#clearConfig
