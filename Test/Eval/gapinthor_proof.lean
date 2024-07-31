import LeanSAT.Tactics.BVDecide

open Std (BitVec)
theorem inthor_test1_thm (x : _root_.BitVec 23) :
    x ||| 8388607#23 ^^^ x = 8388607#23 := by
  bv_decide

theorem inthor_test2_thm (x x_1 : _root_.BitVec 39) :
  x_1 + (x &&& 274877906944#39) &&& 274877906944#39 ||| x_1 &&& 274877906943#39 = x_1 + (x &&& 274877906944#39) := by
  bv_decide

theorem inthor_test4_thm (x : _root_.BitVec 1023) :
  x |||
      89884656743115795386465259539451236680898848947115328636715040578866337902750481566354238661203768010560056939935696678829394884407208311246423715319737062188883946712432742638151109800623047059726541476042502884419075341171231440736956555270413618581675255342293149119973622969239858152417678164812112068607#1023 ^^^
        x =
    89884656743115795386465259539451236680898848947115328636715040578866337902750481566354238661203768010560056939935696678829394884407208311246423715319737062188883946712432742638151109800623047059726541476042502884419075341171231440736956555270413618581675255342293149119973622969239858152417678164812112068607#1023 := by
  bv_decide

theorem inthor_test5_thm (x x_1 : _root_.BitVec 399) :
  x_1 + (x &&& 18446742974197923840#399) &&&
        1291124939043454294827959586001505937164852896414611756415329678270323811008420597314822676640068915717951585711495839744#399 |||
      x_1 &&& 274877906943#399 =
    x_1 + (x &&& 18446742974197923840#399) := by
  bv_decide