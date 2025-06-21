;; Grid Operator Verification Contract
;; Validates and manages smart grid operators

;; Constants
(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_VERIFIED (err u101))
(define-constant ERR_NOT_FOUND (err u102))
(define-constant ERR_INVALID_OPERATOR (err u103))

;; Data Variables
(define-data-var total-operators uint u0)

;; Data Maps
(define-map verified-operators principal {
    verified: bool,
    verification-date: uint,
    operator-type: (string-ascii 50),
    capacity-mw: uint,
    region: (string-ascii 50)
})

(define-map operator-permissions principal {
    can-balance-load: bool,
    can-manage-demand: bool,
    can-coordinate-storage: bool,
    can-optimize-efficiency: bool
})

;; Public Functions

;; Verify a new grid operator
(define-public (verify-operator (operator principal) (operator-type (string-ascii 50)) (capacity-mw uint) (region (string-ascii 50)))
    (begin
        (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
        (asserts! (is-none (map-get? verified-operators operator)) ERR_ALREADY_VERIFIED)
        (map-set verified-operators operator {
            verified: true,
            verification-date: block-height,
            operator-type: operator-type,
            capacity-mw: capacity-mw,
            region: region
        })
        (map-set operator-permissions operator {
            can-balance-load: true,
            can-manage-demand: true,
            can-coordinate-storage: true,
            can-optimize-efficiency: true
        })
        (var-set total-operators (+ (var-get total-operators) u1))
        (ok true)
    )
)

;; Revoke operator verification
(define-public (revoke-operator (operator principal))
    (begin
        (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
        (asserts! (is-some (map-get? verified-operators operator)) ERR_NOT_FOUND)
        (map-delete verified-operators operator)
        (map-delete operator-permissions operator)
        (var-set total-operators (- (var-get total-operators) u1))
        (ok true)
    )
)

;; Read-only Functions

;; Check if operator is verified
(define-read-only (is-verified-operator (operator principal))
    (match (map-get? verified-operators operator)
        operator-data (get verified operator-data)
        false
    )
)

;; Get operator details
(define-read-only (get-operator-details (operator principal))
    (map-get? verified-operators operator)
)

;; Get operator permissions
(define-read-only (get-operator-permissions (operator principal))
    (map-get? operator-permissions operator)
)

;; Get total verified operators
(define-read-only (get-total-operators)
    (var-get total-operators)
)
