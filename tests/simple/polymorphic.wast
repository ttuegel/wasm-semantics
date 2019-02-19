;; drop

(i32.const 15)
(drop)
#assertStack .Stack "drop i32"

(i64.const 15)
(drop)
#assertStack .Stack "drop i64"

(f32.const 15.0)
(drop)
#assertStack .Stack "drop f32"

(f64.const 15.0)
(drop)
#assertStack .Stack "drop f64"

(i32.const 5)
(drop (i32.const 1))
#assertTopStack < i32 > 5 "folded drop"

;; select

(i32.const -1)
(i32.const 1)
(i32.const 1)
(select)
#assertTopStack < i32 > -1 "select i32 true"

(i32.const -1)
(i32.const 1)
(i32.const 0)
(select)
#assertTopStack < i32 > 1 "select i32 false"

(i64.const -1)
(i64.const 1)
(i32.const 1)
(select)
#assertTopStack < i64 > -1 "select i64 true"

(i64.const -1)
(i64.const 1)
(i32.const 0)
(select)
#assertTopStack < i64 > 1 "select i64 false"

(select (i32.const 1) (i32.const 0) (i32.const 1))
#assertTopStack < i32 > 1 "folded select i32"

(select (i64.const 1) (i64.const 0) (i32.const 0))
#assertTopStack < i64 > 0 "folded select i64"
