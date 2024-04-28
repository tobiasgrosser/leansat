import LeanSAT.Reflect.BVExpr.BitBlast.Lemmas.Basic
import LeanSAT.Reflect.BVExpr.BitBlast.Impl.Const

open AIG

namespace BVExpr
namespace bitblast
namespace blastConst

theorem go_getRef_aux (aig : AIG BVBit) (c : BitVec w) (curr : Nat) (hcurr : curr ≤ w)
    (s : AIG.RefStream aig curr)
    -- The hfoo here is a trick to make the dependent type gods happy
    : ∀ (idx : Nat) (hidx : idx < curr) (hfoo),
        (go aig curr s c hcurr).stream.getRef idx (by omega)
          =
        (s.getRef idx hidx).cast hfoo := by
  intro idx hidx
  generalize hgo : go aig curr s c hcurr = res
  unfold go at hgo
  split at hgo
  . dsimp at hgo
    rw [← hgo]
    intro hfoo
    rw [go_getRef_aux]
    rw [AIG.RefStream.getRef_push_ref_lt]
    . simp only [Ref.cast, Ref.mk.injEq]
      rw [AIG.RefStream.getRef_cast]
      . simp
      . assumption
    . apply go_le_size
  . dsimp at hgo
    rw [← hgo]
    simp only [Nat.le_refl, RefStream.getRef, Ref_cast', Ref.mk.injEq, true_implies]
    congr
    . omega
    . simp
termination_by w - curr

theorem go_getRef (aig : AIG BVBit) (c : BitVec w)
    (curr : Nat) (hcurr : curr ≤ w) (s : AIG.RefStream aig curr)
    : ∀ (idx : Nat) (hidx : idx < curr),
        (go aig curr s c hcurr).stream.getRef idx (by omega)
          =
        (s.getRef idx hidx).cast (by apply go_le_size) := by
  intros
  apply go_getRef_aux

theorem go_denote_mem_prefix (aig : AIG BVBit) (idx : Nat) (hidx)
    (s : AIG.RefStream aig idx) (c : BitVec w) (start : Nat) (hstart)
  : ⟦
      (go aig idx s c hidx).aig,
      ⟨start, by apply Nat.lt_of_lt_of_le; exact hstart; apply go_le_size⟩,
      assign
    ⟧
      =
    ⟦aig, ⟨start, hstart⟩, assign⟧ := by
  apply denote.eq_of_aig_eq (entry := ⟨aig, start,hstart⟩)
  apply IsPrefix.of
  . intros
    apply go_decl_eq
  . intros
    apply go_le_size

theorem go_eq_eval_getLsb (aig : AIG BVBit) (c : BitVec w) (assign : Assignment)
    (curr : Nat) (hcurr : curr ≤ w) (s : AIG.RefStream aig curr)
    : ∀ (idx : Nat) (hidx1 : idx < w) (hidx2 : curr ≤ idx),
        ⟦
          (go aig curr s c hcurr).aig,
          (go aig curr s c hcurr).stream.getRef idx hidx1,
          assign.toAIGAssignment
        ⟧
          =
        ((BVExpr.const c).eval assign).getLsb idx := by
  intro idx hidx1 hidx2
  generalize hgo : go aig curr s c hcurr = res
  unfold go at hgo
  split at hgo
  . dsimp at hgo
    cases Nat.eq_or_lt_of_le hidx2 with
    | inl heq =>
      rw [← hgo]
      rw [go_getRef]
      rw [AIG.RefStream.getRef_push_ref_eq']
      . rw [← heq]
        rw [go_denote_mem_prefix]
        . simp
        . simp [Ref.hgate]
      . rw [heq]
    | inr =>
      rw [← hgo]
      dsimp
      rw [go_eq_eval_getLsb]
      . simp
      . omega
  . omega
termination_by w - curr

end blastConst

theorem blastConst_eq_eval_getLsb (aig : AIG BVBit) (c : BitVec w) (assign : Assignment)
    : ∀ (idx : Nat) (hidx : idx < w),
        ⟦(blastConst aig c).aig, (blastConst aig c).stream.getRef idx hidx, assign.toAIGAssignment⟧
          =
        ((BVExpr.const c).eval assign).getLsb idx := by
  intros
  apply blastConst.go_eq_eval_getLsb
  omega

end bitblast
end BVExpr