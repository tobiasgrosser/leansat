/-
Copyright (c) 2024 Lean FRO, LLC. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Scott Morrison
-/
import LeanSAT.Sat.Basic

set_option linter.missingDocs false

open Lean Meta Sat

inductive Gate
| and
| or
| xor
| beq
| imp

namespace Gate

def toString : Gate → String
  | and => "&&"
  | or  => "||"
  | xor => "^^"
  | beq => "=="
  | imp => "→"

def eval : Gate → Bool → Bool → Bool
  | and => (· && ·)
  | or => (· || ·)
  | xor => _root_.xor
  | beq => (· == ·)
  | imp => (!· || ·)

end Gate

inductive BoolExpr (α : Type)
  | literal : α → BoolExpr α
  | const : Bool → BoolExpr α
  | not : BoolExpr α → BoolExpr α
  | gate : Gate → BoolExpr α → BoolExpr α → BoolExpr α

namespace BoolExpr

def toString [ToString α] : BoolExpr α → String
  | literal a => ToString.toString a
  | const b => ToString.toString b
  | not x => "!" ++ toString x
  | gate g x y => "(" ++ toString x ++ " " ++ g.toString ++ " " ++ toString y ++ ")"

instance [ToString α] : ToString (BoolExpr α) := ⟨toString⟩

def size : BoolExpr α → Nat
  | .literal _
  | .const _ => 1
  | .not x => x.size + 1
  | .gate _ x y => x.size + y.size + 1

theorem size_pos (x : BoolExpr α) : 0 < x.size := by
  cases x <;> simp [size] <;> omega

def eval (f : α → Bool) : BoolExpr α → Bool
  | .literal a => f a
  | .const b => b
  | .not x => !eval f x
  | .gate g x y => g.eval (eval f x) (eval f y)

@[simp] theorem eval_literal : eval f (.literal a) = f a := rfl
@[simp] theorem eval_const : eval f (.const b) = b := rfl
@[simp] theorem eval_not : eval f (.not x) = !eval f x := rfl
@[simp] theorem eval_gate : eval f (.gate g x y) = g.eval (eval f x) (eval f y) := rfl

def sat (f : α → Bool) (x : BoolExpr α) : Prop := eval f x = true

instance : HSat α (BoolExpr α) where
  eval := sat

theorem sat_and {x y : BoolExpr α} {f : α → Bool} (hx : f ⊨ x) (hy : f ⊨ y)
    : f ⊨ (BoolExpr.gate .and x y) := by
  simp only [(· ⊨ ·), sat] at *
  simp [hx, hy, Gate.eval]

theorem sat_true {f : α → Bool} : f ⊨ (BoolExpr.const true : BoolExpr α) := rfl

end BoolExpr
