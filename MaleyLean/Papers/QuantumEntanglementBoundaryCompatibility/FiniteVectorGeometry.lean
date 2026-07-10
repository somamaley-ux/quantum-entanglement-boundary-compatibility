import MaleyLean.Papers.QuantumEntanglementBoundaryCompatibility.FiniteGeometryProfile

namespace MaleyLean
namespace Papers
namespace QuantumEntanglementBoundaryCompatibility

structure IntPlaneVector where
  x : Int
  y : Int

def dot (u v : IntPlaneVector) : Int :=
  u.x * v.x + u.y * v.y

def normSq (u : IntPlaneVector) : Int :=
  dot u u

def aliceAxisVector : AliceAxis -> IntPlaneVector
  | .a0 => { x := 1, y := 0 }
  | .a1 => { x := 0, y := 1 }

def bobAxisVector : BobAxis -> IntPlaneVector
  | .b0 => { x := -5, y := -5 }
  | .b1 => { x := -5, y := 5 }

def scaledVectorInnerProduct32 (A : AliceAxis) (B : BobAxis) : Int :=
  4 * dot (aliceAxisVector A) (bobAxisVector B)

theorem aliceAxisVector_normSq
    (A : AliceAxis) :
    normSq (aliceAxisVector A) = 1 := by
  cases A <;> decide

theorem bobAxisVector_normSq
    (B : BobAxis) :
    normSq (bobAxisVector B) = 50 := by
  cases B <;> decide

theorem finiteVector_scaledInnerProduct_matches_axisProfile
    (A : AliceAxis)
    (B : BobAxis) :
    scaledVectorInnerProduct32 A B =
      scaledAxisInnerProduct32 A B := by
  cases A <;> cases B <;> decide

def singletCorrelationFromVectors32
    (x y : BellSetting) : Int :=
  - scaledVectorInnerProduct32
      (aliceAxisOfSetting x)
      (bobAxisOfSetting y)

theorem finiteVector_singletCorrelation_matches_axisCorrelation
    (x y : BellSetting) :
    singletCorrelationFromVectors32 x y =
      singletCorrelationFromAxes32 x y := by
  cases x <;> cases y <;> decide

def vectorBornWeight32
    (x y : BellSetting)
    (a b : BellOutcome) : Int :=
  if sameOutcome a b then
    bornSameCellWeight32 (singletCorrelationFromVectors32 x y)
  else
    bornOppositeCellWeight32 (singletCorrelationFromVectors32 x y)

theorem vectorBornWeight_matches_axisBornWeight32
    (x y : BellSetting)
    (a b : BellOutcome) :
    vectorBornWeight32 x y a b =
      axisBornWeight32 x y a b := by
  cases x <;> cases y <;> cases a <;> cases b <;> decide

theorem vectorBornWeight_matches_concreteCHSHWeight32
    (x y : BellSetting)
    (a b : BellOutcome) :
    vectorBornWeight32 x y a b =
      Int.ofNat (concreteCHSHWeight32 x y a b) := by
  rw [vectorBornWeight_matches_axisBornWeight32,
    axisBornWeight_matches_concreteCHSHWeight32]

theorem vectorBorn_table_normalized32
    (x y : BellSetting) :
    vectorBornWeight32 x y .plus .plus +
    vectorBornWeight32 x y .plus .minus +
    vectorBornWeight32 x y .minus .plus +
    vectorBornWeight32 x y .minus .minus = 32 := by
  cases x <;> cases y <;> decide

theorem vectorBorn_alice_no_signaling32
    (x y1 y2 : BellSetting)
    (a : BellOutcome) :
    vectorBornWeight32 x y1 a .plus +
      vectorBornWeight32 x y1 a .minus =
    vectorBornWeight32 x y2 a .plus +
      vectorBornWeight32 x y2 a .minus := by
  cases x <;> cases y1 <;> cases y2 <;> cases a <;> decide

theorem vectorBorn_bob_no_signaling32
    (x1 x2 y : BellSetting)
    (b : BellOutcome) :
    vectorBornWeight32 x1 y .plus b +
      vectorBornWeight32 x1 y .minus b =
    vectorBornWeight32 x2 y .plus b +
      vectorBornWeight32 x2 y .minus b := by
  cases x1 <;> cases x2 <;> cases y <;> cases b <;> decide

def FiniteVectorGeometryDerivesAxisBornProfile : Prop :=
  (forall A B,
    scaledVectorInnerProduct32 A B =
      scaledAxisInnerProduct32 A B) /\
  (forall x y,
    singletCorrelationFromVectors32 x y =
      singletCorrelationFromAxes32 x y) /\
  (forall x y a b,
    vectorBornWeight32 x y a b =
      axisBornWeight32 x y a b) /\
  (forall x y a b,
    vectorBornWeight32 x y a b =
      Int.ofNat (concreteCHSHWeight32 x y a b)) /\
  chshNumerator32 = 80 /\
  chshNumerator32 - 64 = 16

theorem finiteVectorGeometry_derives_axisBorn_profile :
    FiniteVectorGeometryDerivesAxisBornProfile := by
  exact And.intro finiteVector_scaledInnerProduct_matches_axisProfile <|
    And.intro finiteVector_singletCorrelation_matches_axisCorrelation <|
      And.intro vectorBornWeight_matches_axisBornWeight32 <|
        And.intro vectorBornWeight_matches_concreteCHSHWeight32 <|
          And.intro concreteCHSH_value32
            concreteCHSH_exceeds_classical_bound_by_gap32

end QuantumEntanglementBoundaryCompatibility
end Papers
end MaleyLean
