;; Wrap.

(i64.const 4294967296)    ;; 2^32
(i32.wrap_i64)
#assertTopStack < i32 > 0 "wrap 2^32"

(i64.const 4294967295)    ;; 2^32 - 1
(i32.wrap_i64)
#assertTopStack < i32 > 4294967295 "wrap 2^32 - 1"

(i32.wrap_i64 (i64.const 4294967298))
#assertTopStack < i32 > 2 "wrap 2^32 + 2"

;; Extend.

(i32.const 4294967295)    ;; 2^32 - 1
(i64.extend_i32_u)
#assertTopStack < i64 > 4294967295 "extend unsig"

(i32.const -1)    ;; 2^32 - 1
(i64.extend_i32_s)
#assertTopStack < i64 > -1 "extend sig"

(i32.const 10)
(i32.extend_i32_s)
#assertTrap "Bad return type for `extend_i32_s`"

(i64.const 10)
(i64.wrap_i64)
#assertTrap "Bad return type for `wrap_i64`"

(i64.extend_i32_s (i32.const 15))
#assertTopStack < i64 > 15 "extend sig folded"
