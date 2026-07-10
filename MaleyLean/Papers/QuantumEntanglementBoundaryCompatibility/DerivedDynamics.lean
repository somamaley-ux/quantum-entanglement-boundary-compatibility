import MaleyLean.Papers.QuantumEntanglementBoundaryCompatibility.FiniteVectorGeometry

namespace MaleyLean
namespace Papers
namespace QuantumEntanglementBoundaryCompatibility

structure IntBellTable32 where
  weight : BellSetting -> BellSetting -> BellOutcome -> BellOutcome -> Int

def tableSignedWeight32
    (T : IntBellTable32)
    (x y : BellSetting)
    (a b : BellOutcome) : Int :=
  outcomeSign a * outcomeSign b * T.weight x y a b

def tableCorrelatorNumerator32
    (T : IntBellTable32)
    (x y : BellSetting) : Int :=
  tableSignedWeight32 T x y .plus .plus +
  tableSignedWeight32 T x y .plus .minus +
  tableSignedWeight32 T x y .minus .plus +
  tableSignedWeight32 T x y .minus .minus

def tableCHSHNumerator32 (T : IntBellTable32) : Int :=
  tableCorrelatorNumerator32 T .s0 .s0 +
  tableCorrelatorNumerator32 T .s0 .s1 +
  tableCorrelatorNumerator32 T .s1 .s0 -
  tableCorrelatorNumerator32 T .s1 .s1

def concreteIntBellTable32 : IntBellTable32 where
  weight x y a b := Int.ofNat (concreteCHSHWeight32 x y a b)

def vectorIntBellTable32 : IntBellTable32 where
  weight := vectorBornWeight32

theorem concreteTableCHSH_matches_original32 :
    tableCHSHNumerator32 concreteIntBellTable32 =
      chshNumerator32 := by
  rfl

theorem concreteTableCHSH_value32 :
    tableCHSHNumerator32 concreteIntBellTable32 = 80 := by
  rfl

theorem vectorTableCHSH_matches_concrete32 :
    tableCHSHNumerator32 vectorIntBellTable32 =
      tableCHSHNumerator32 concreteIntBellTable32 := by
  rfl

theorem vectorTableCHSH_value32 :
    tableCHSHNumerator32 vectorIntBellTable32 = 80 := by
  rfl

def structuralBornWeight32
    (corr : Int)
    (a b : BellOutcome) : Int :=
  if sameOutcome a b then
    bornSameCellWeight32 corr
  else
    bornOppositeCellWeight32 corr

theorem structuralBorn_two_outcome_normalized32
    (corr : Int)
    (hbounded : corr = 20 \/ corr = -20) :
    structuralBornWeight32 corr .plus .plus +
    structuralBornWeight32 corr .plus .minus +
    structuralBornWeight32 corr .minus .plus +
    structuralBornWeight32 corr .minus .minus = 32 := by
  cases hbounded with
  | inl h => rw [h]; rfl
  | inr h => rw [h]; rfl

theorem structuralBorn_alice_uniform_marginal32
    (corr : Int)
    (hbounded : corr = 20 \/ corr = -20)
    (a : BellOutcome) :
    structuralBornWeight32 corr a .plus +
      structuralBornWeight32 corr a .minus = 16 := by
  cases hbounded with
  | inl h =>
      rw [h]
      cases a <;> rfl
  | inr h =>
      rw [h]
      cases a <;> rfl

theorem structuralBorn_bob_uniform_marginal32
    (corr : Int)
    (hbounded : corr = 20 \/ corr = -20)
    (b : BellOutcome) :
    structuralBornWeight32 corr .plus b +
      structuralBornWeight32 corr .minus b = 16 := by
  cases hbounded with
  | inl h =>
      rw [h]
      cases b <;> rfl
  | inr h =>
      rw [h]
      cases b <;> rfl

structure SameOppositeTwoOutcomeWeights where
  sameWeight : Int
  oppositeWeight : Int

def sameOppositeTwoOutcomeWeight
    (W : SameOppositeTwoOutcomeWeights)
    (a b : BellOutcome) : Int :=
  if sameOutcome a b then W.sameWeight else W.oppositeWeight

theorem sameOpposite_alice_marginal
    (W : SameOppositeTwoOutcomeWeights)
    (a : BellOutcome) :
  sameOppositeTwoOutcomeWeight W a .plus +
      sameOppositeTwoOutcomeWeight W a .minus =
    W.sameWeight + W.oppositeWeight := by
  cases a
  · simp [sameOppositeTwoOutcomeWeight, sameOutcome, Int.add_comm]
  · simp [sameOppositeTwoOutcomeWeight, sameOutcome]

theorem sameOpposite_bob_marginal
    (W : SameOppositeTwoOutcomeWeights)
    (b : BellOutcome) :
  sameOppositeTwoOutcomeWeight W .plus b +
      sameOppositeTwoOutcomeWeight W .minus b =
    W.sameWeight + W.oppositeWeight := by
  cases b
  · simp [sameOppositeTwoOutcomeWeight, sameOutcome, Int.add_comm]
  · simp [sameOppositeTwoOutcomeWeight, sameOutcome]

theorem sameOpposite_two_outcome_normalized
    (W : SameOppositeTwoOutcomeWeights) :
    sameOppositeTwoOutcomeWeight W .plus .plus +
    sameOppositeTwoOutcomeWeight W .plus .minus +
    sameOppositeTwoOutcomeWeight W .minus .plus +
    sameOppositeTwoOutcomeWeight W .minus .minus =
    W.sameWeight + W.oppositeWeight +
      W.oppositeWeight + W.sameWeight := by
  simp [sameOppositeTwoOutcomeWeight, sameOutcome]

def structuralBornAsSameOpposite32
    (corr : Int) : SameOppositeTwoOutcomeWeights where
  sameWeight := bornSameCellWeight32 corr
  oppositeWeight := bornOppositeCellWeight32 corr

theorem structuralBorn_is_sameOpposite32
    (corr : Int)
    (a b : BellOutcome) :
    structuralBornWeight32 corr a b =
      sameOppositeTwoOutcomeWeight
        (structuralBornAsSameOpposite32 corr) a b := by
  rfl

theorem vectorCorrelation_is_plus_or_minus_twenty32
    (x y : BellSetting) :
    singletCorrelationFromVectors32 x y = 20 \/
      singletCorrelationFromVectors32 x y = -20 := by
  cases x <;> cases y <;>
    first | exact Or.inl rfl | exact Or.inr rfl

theorem vectorBornWeight_is_structuralBornWeight32
    (x y : BellSetting)
    (a b : BellOutcome) :
    vectorBornWeight32 x y a b =
      structuralBornWeight32 (singletCorrelationFromVectors32 x y) a b := by
  rfl

theorem vectorBorn_no_signaling_from_structural_symmetry32
    (x y1 y2 : BellSetting)
    (a : BellOutcome) :
    vectorBornWeight32 x y1 a .plus +
      vectorBornWeight32 x y1 a .minus =
    vectorBornWeight32 x y2 a .plus +
      vectorBornWeight32 x y2 a .minus := by
  calc
    vectorBornWeight32 x y1 a .plus +
        vectorBornWeight32 x y1 a .minus
        = structuralBornWeight32
            (singletCorrelationFromVectors32 x y1) a .plus +
          structuralBornWeight32
            (singletCorrelationFromVectors32 x y1) a .minus := by
            rfl
    _ = 16 := structuralBorn_alice_uniform_marginal32
      (singletCorrelationFromVectors32 x y1)
      (vectorCorrelation_is_plus_or_minus_twenty32 x y1) a
    _ = structuralBornWeight32
            (singletCorrelationFromVectors32 x y2) a .plus +
          structuralBornWeight32
            (singletCorrelationFromVectors32 x y2) a .minus := by
            symm
            exact structuralBorn_alice_uniform_marginal32
              (singletCorrelationFromVectors32 x y2)
              (vectorCorrelation_is_plus_or_minus_twenty32 x y2) a
    _ = vectorBornWeight32 x y2 a .plus +
        vectorBornWeight32 x y2 a .minus := by
        rfl

theorem vectorBorn_bob_no_signaling_from_structural_symmetry32
    (x1 x2 y : BellSetting)
    (b : BellOutcome) :
    vectorBornWeight32 x1 y .plus b +
      vectorBornWeight32 x1 y .minus b =
    vectorBornWeight32 x2 y .plus b +
      vectorBornWeight32 x2 y .minus b := by
  calc
    vectorBornWeight32 x1 y .plus b +
        vectorBornWeight32 x1 y .minus b
        = structuralBornWeight32
            (singletCorrelationFromVectors32 x1 y) .plus b +
          structuralBornWeight32
            (singletCorrelationFromVectors32 x1 y) .minus b := by
            rfl
    _ = 16 := structuralBorn_bob_uniform_marginal32
      (singletCorrelationFromVectors32 x1 y)
      (vectorCorrelation_is_plus_or_minus_twenty32 x1 y) b
    _ = structuralBornWeight32
            (singletCorrelationFromVectors32 x2 y) .plus b +
          structuralBornWeight32
            (singletCorrelationFromVectors32 x2 y) .minus b := by
            symm
            exact structuralBorn_bob_uniform_marginal32
              (singletCorrelationFromVectors32 x2 y)
              (vectorCorrelation_is_plus_or_minus_twenty32 x2 y) b
    _ = vectorBornWeight32 x2 y .plus b +
        vectorBornWeight32 x2 y .minus b := by
        rfl

structure FiniteVectorGeometryInterface where
  aliceVector : AliceAxis -> IntPlaneVector
  bobVector : BobAxis -> IntPlaneVector
  scaledInnerProduct32 : AliceAxis -> BobAxis -> Int
  scaledInnerProduct_from_vectors :
    forall A B,
      scaledInnerProduct32 A B =
        4 * dot (aliceVector A) (bobVector B)
  scaledInnerProduct_matches_axis_profile :
    forall A B,
      scaledInnerProduct32 A B =
        scaledAxisInnerProduct32 A B

def interfaceSingletCorrelation32
    (G : FiniteVectorGeometryInterface)
    (x y : BellSetting) : Int :=
  - G.scaledInnerProduct32
      (aliceAxisOfSetting x)
      (bobAxisOfSetting y)

def interfaceBornWeight32
    (G : FiniteVectorGeometryInterface)
    (x y : BellSetting)
    (a b : BellOutcome) : Int :=
  if sameOutcome a b then
    bornSameCellWeight32 (interfaceSingletCorrelation32 G x y)
  else
    bornOppositeCellWeight32 (interfaceSingletCorrelation32 G x y)

def concreteFiniteVectorGeometryInterface :
    FiniteVectorGeometryInterface where
  aliceVector := aliceAxisVector
  bobVector := bobAxisVector
  scaledInnerProduct32 := scaledVectorInnerProduct32
  scaledInnerProduct_from_vectors := by
    intro A B
    rfl
  scaledInnerProduct_matches_axis_profile :=
    finiteVector_scaledInnerProduct_matches_axisProfile

theorem interfaceSingletCorrelation_matches_axes32
    (G : FiniteVectorGeometryInterface)
    (x y : BellSetting) :
    interfaceSingletCorrelation32 G x y =
      singletCorrelationFromAxes32 x y := by
  unfold interfaceSingletCorrelation32 singletCorrelationFromAxes32
  rw [G.scaledInnerProduct_matches_axis_profile]

theorem concreteInterfaceBornWeight_matches_vectorBorn32
    (x y : BellSetting)
    (a b : BellOutcome) :
    interfaceBornWeight32
        concreteFiniteVectorGeometryInterface x y a b =
      vectorBornWeight32 x y a b := by
  cases x <;> cases y <;> cases a <;> cases b <;> decide

inductive ConvexLocalCHSHMass32 where
  | mass00 | mass01 | mass02 | mass03 | mass04 | mass05 | mass06 | mass07
  | mass08 | mass09 | mass10 | mass11 | mass12 | mass13 | mass14 | mass15
  | mass16 | mass17 | mass18 | mass19 | mass20 | mass21 | mass22 | mass23
  | mass24 | mass25 | mass26 | mass27 | mass28 | mass29 | mass30 | mass31
  | mass32
deriving DecidableEq, Repr

def convexLocalPlusMass32 : ConvexLocalCHSHMass32 -> Nat
  | .mass00 => 32
  | .mass01 => 31
  | .mass02 => 30
  | .mass03 => 29
  | .mass04 => 28
  | .mass05 => 27
  | .mass06 => 26
  | .mass07 => 25
  | .mass08 => 24
  | .mass09 => 23
  | .mass10 => 22
  | .mass11 => 21
  | .mass12 => 20
  | .mass13 => 19
  | .mass14 => 18
  | .mass15 => 17
  | .mass16 => 16
  | .mass17 => 15
  | .mass18 => 14
  | .mass19 => 13
  | .mass20 => 12
  | .mass21 => 11
  | .mass22 => 10
  | .mass23 => 9
  | .mass24 => 8
  | .mass25 => 7
  | .mass26 => 6
  | .mass27 => 5
  | .mass28 => 4
  | .mass29 => 3
  | .mass30 => 2
  | .mass31 => 1
  | .mass32 => 0

def convexLocalMinusMass32 : ConvexLocalCHSHMass32 -> Nat
  | .mass00 => 0
  | .mass01 => 1
  | .mass02 => 2
  | .mass03 => 3
  | .mass04 => 4
  | .mass05 => 5
  | .mass06 => 6
  | .mass07 => 7
  | .mass08 => 8
  | .mass09 => 9
  | .mass10 => 10
  | .mass11 => 11
  | .mass12 => 12
  | .mass13 => 13
  | .mass14 => 14
  | .mass15 => 15
  | .mass16 => 16
  | .mass17 => 17
  | .mass18 => 18
  | .mass19 => 19
  | .mass20 => 20
  | .mass21 => 21
  | .mass22 => 22
  | .mass23 => 23
  | .mass24 => 24
  | .mass25 => 25
  | .mass26 => 26
  | .mass27 => 27
  | .mass28 => 28
  | .mass29 => 29
  | .mass30 => 30
  | .mass31 => 31
  | .mass32 => 32

theorem convexLocalCHSHMass32_total
    (M : ConvexLocalCHSHMass32) :
    convexLocalPlusMass32 M + convexLocalMinusMass32 M = 32 := by
  cases M <;> rfl

def convexLocalCHSHNumerator32 : ConvexLocalCHSHMass32 -> Int
  | .mass00 => 64
  | .mass01 => 60
  | .mass02 => 56
  | .mass03 => 52
  | .mass04 => 48
  | .mass05 => 44
  | .mass06 => 40
  | .mass07 => 36
  | .mass08 => 32
  | .mass09 => 28
  | .mass10 => 24
  | .mass11 => 20
  | .mass12 => 16
  | .mass13 => 12
  | .mass14 => 8
  | .mass15 => 4
  | .mass16 => 0
  | .mass17 => -4
  | .mass18 => -8
  | .mass19 => -12
  | .mass20 => -16
  | .mass21 => -20
  | .mass22 => -24
  | .mass23 => -28
  | .mass24 => -32
  | .mass25 => -36
  | .mass26 => -40
  | .mass27 => -44
  | .mass28 => -48
  | .mass29 => -52
  | .mass30 => -56
  | .mass31 => -60
  | .mass32 => -64

def ConvexLocalEnvelope32 (n : Int) : Prop :=
  exists M : ConvexLocalCHSHMass32, n = convexLocalCHSHNumerator32 M

inductive DeterministicAssignmentIndex where
  | mmmm | mmmp | mmpm | mmpp
  | mpmm | mpmp | mppm | mppp
  | pmmm | pmmp | pmpm | pmpp
  | ppmm | ppmp | pppm | pppp
deriving DecidableEq, Repr

def deterministicAssignmentOfIndex :
    DeterministicAssignmentIndex -> DeterministicLocalAssignment
  | .mmmm => DeterministicLocalAssignment.mk .minus .minus .minus .minus
  | .mmmp => DeterministicLocalAssignment.mk .minus .minus .minus .plus
  | .mmpm => DeterministicLocalAssignment.mk .minus .minus .plus .minus
  | .mmpp => DeterministicLocalAssignment.mk .minus .minus .plus .plus
  | .mpmm => DeterministicLocalAssignment.mk .minus .plus .minus .minus
  | .mpmp => DeterministicLocalAssignment.mk .minus .plus .minus .plus
  | .mppm => DeterministicLocalAssignment.mk .minus .plus .plus .minus
  | .mppp => DeterministicLocalAssignment.mk .minus .plus .plus .plus
  | .pmmm => DeterministicLocalAssignment.mk .plus .minus .minus .minus
  | .pmmp => DeterministicLocalAssignment.mk .plus .minus .minus .plus
  | .pmpm => DeterministicLocalAssignment.mk .plus .minus .plus .minus
  | .pmpp => DeterministicLocalAssignment.mk .plus .minus .plus .plus
  | .ppmm => DeterministicLocalAssignment.mk .plus .plus .minus .minus
  | .ppmp => DeterministicLocalAssignment.mk .plus .plus .minus .plus
  | .pppm => DeterministicLocalAssignment.mk .plus .plus .plus .minus
  | .pppp => DeterministicLocalAssignment.mk .plus .plus .plus .plus

def deterministicLocalWeight32
    (L : DeterministicLocalAssignment)
    (x y : BellSetting)
    (a b : BellOutcome) : Int :=
  if a = aliceValue L x then
    if b = bobValue L y then 32 else 0
  else
    0

def deterministicLocalTable32
    (L : DeterministicLocalAssignment) : IntBellTable32 where
  weight := deterministicLocalWeight32 L

theorem deterministicLocalTableCHSH_matches_assignment32
    (L : DeterministicLocalAssignment) :
    tableCHSHNumerator32 (deterministicLocalTable32 L) =
      deterministicCHSHNumerator32 L := by
  cases L with
  | mk a0 a1 b0 b1 =>
      cases a0 <;> cases a1 <;> cases b0 <;> cases b1 <;> decide

theorem deterministicAssignmentIndex_raw_classified
    (I : DeterministicAssignmentIndex) :
    deterministicCHSHRaw (deterministicAssignmentOfIndex I) = 2 \/
      deterministicCHSHRaw (deterministicAssignmentOfIndex I) = -2 := by
  cases I <;> decide

theorem deterministicAssignmentIndex_table_extreme32
    (I : DeterministicAssignmentIndex) :
    tableCHSHNumerator32
        (deterministicLocalTable32 (deterministicAssignmentOfIndex I)) = 64 \/
      tableCHSHNumerator32
        (deterministicLocalTable32 (deterministicAssignmentOfIndex I)) = -64 := by
  cases I <;> decide

theorem deterministicAssignmentIndex_table_in_convex_envelope32
    (I : DeterministicAssignmentIndex) :
    ConvexLocalEnvelope32
      (tableCHSHNumerator32
        (deterministicLocalTable32 (deterministicAssignmentOfIndex I))) := by
  cases I
  case mmmm => exact Exists.intro ConvexLocalCHSHMass32.mass00 (by decide)
  case mmmp => exact Exists.intro ConvexLocalCHSHMass32.mass00 (by decide)
  case mmpm => exact Exists.intro ConvexLocalCHSHMass32.mass32 (by decide)
  case mmpp => exact Exists.intro ConvexLocalCHSHMass32.mass32 (by decide)
  case mpmm => exact Exists.intro ConvexLocalCHSHMass32.mass00 (by decide)
  case mpmp => exact Exists.intro ConvexLocalCHSHMass32.mass32 (by decide)
  case mppm => exact Exists.intro ConvexLocalCHSHMass32.mass00 (by decide)
  case mppp => exact Exists.intro ConvexLocalCHSHMass32.mass32 (by decide)
  case pmmm => exact Exists.intro ConvexLocalCHSHMass32.mass32 (by decide)
  case pmmp => exact Exists.intro ConvexLocalCHSHMass32.mass00 (by decide)
  case pmpm => exact Exists.intro ConvexLocalCHSHMass32.mass32 (by decide)
  case pmpp => exact Exists.intro ConvexLocalCHSHMass32.mass00 (by decide)
  case ppmm => exact Exists.intro ConvexLocalCHSHMass32.mass32 (by decide)
  case ppmp => exact Exists.intro ConvexLocalCHSHMass32.mass32 (by decide)
  case pppm => exact Exists.intro ConvexLocalCHSHMass32.mass00 (by decide)
  case pppp => exact Exists.intro ConvexLocalCHSHMass32.mass00 (by decide)

structure Denominator32LocalHiddenVariableModel where
  massProfile : ConvexLocalCHSHMass32
  positiveSource : DeterministicAssignmentIndex
  positiveSource_is_positive :
    deterministicCHSHRaw (deterministicAssignmentOfIndex positiveSource) = 2
  negativeSource : DeterministicAssignmentIndex
  negativeSource_is_negative :
    deterministicCHSHRaw (deterministicAssignmentOfIndex negativeSource) = -2

def localHiddenVariableCHSHNumerator32
    (H : Denominator32LocalHiddenVariableModel) : Int :=
  convexLocalCHSHNumerator32 H.massProfile

theorem localHiddenVariableCHSH_in_convex_envelope32
    (H : Denominator32LocalHiddenVariableModel) :
    ConvexLocalEnvelope32 (localHiddenVariableCHSHNumerator32 H) := by
  exact Exists.intro H.massProfile rfl

structure GeneralConvexLocalCHSHMass where
  denominator : Nat
  plusMass : Nat
  minusMass : Nat
  total_mass : plusMass + minusMass = denominator

def generalConvexLocalCHSHNumerator
    (M : GeneralConvexLocalCHSHMass) : Int :=
  2 * Int.ofNat M.plusMass - 2 * Int.ofNat M.minusMass

def GeneralConvexLocalEnvelope
    (denominator : Nat)
    (n : Int) : Prop :=
  exists M : GeneralConvexLocalCHSHMass,
    M.denominator = denominator /\
    n = generalConvexLocalCHSHNumerator M

structure GeneralLocalHiddenVariableModel where
  denominator : Nat
  massProfile : GeneralConvexLocalCHSHMass
  denominator_matches : massProfile.denominator = denominator
  positiveSource : DeterministicAssignmentIndex
  positiveSource_is_positive :
    deterministicCHSHRaw (deterministicAssignmentOfIndex positiveSource) = 2
  negativeSource : DeterministicAssignmentIndex
  negativeSource_is_negative :
    deterministicCHSHRaw (deterministicAssignmentOfIndex negativeSource) = -2

def generalLocalHiddenVariableCHSHNumerator
    (H : GeneralLocalHiddenVariableModel) : Int :=
  generalConvexLocalCHSHNumerator H.massProfile

theorem generalLocalHiddenVariableCHSH_in_general_envelope
    (H : GeneralLocalHiddenVariableModel) :
    GeneralConvexLocalEnvelope H.denominator
      (generalLocalHiddenVariableCHSHNumerator H) := by
  exact Exists.intro H.massProfile
    (And.intro H.denominator_matches rfl)

def denominator32Mass_as_general
    (M : ConvexLocalCHSHMass32) : GeneralConvexLocalCHSHMass where
  denominator := 32
  plusMass := convexLocalPlusMass32 M
  minusMass := convexLocalMinusMass32 M
  total_mass := convexLocalCHSHMass32_total M

theorem denominator32Mass_general_value_matches
    (M : ConvexLocalCHSHMass32) :
    generalConvexLocalCHSHNumerator
      (denominator32Mass_as_general M) =
    convexLocalCHSHNumerator32 M := by
  cases M <;> rfl

theorem denominator32Envelope_embeds_general
    {n : Int}
    (h : ConvexLocalEnvelope32 n) :
    GeneralConvexLocalEnvelope 32 n := by
  cases h with
  | intro M hM =>
      exact Exists.intro (denominator32Mass_as_general M)
        (And.intro rfl (by rw [hM, denominator32Mass_general_value_matches]))

theorem convexLocalCHSHNumerator32_cases
    (M : ConvexLocalCHSHMass32) :
    ConvexLocalEnvelope32 (convexLocalCHSHNumerator32 M) := by
  exact Exists.intro M rfl

theorem convexLocalEnvelope_excludes_concreteCHSH80 :
    Not (ConvexLocalEnvelope32 80) := by
  intro h
  cases h with
  | intro M hM =>
      cases M <;> cases hM

theorem vectorCHSH_exceeds_convex_local_envelope32 :
    Not (ConvexLocalEnvelope32
      (tableCHSHNumerator32 vectorIntBellTable32)) := by
  rw [vectorTableCHSH_value32]
  exact convexLocalEnvelope_excludes_concreteCHSH80

theorem vectorBorn_not_denominator32_local_hidden_variable32 :
    Not (exists H : Denominator32LocalHiddenVariableModel,
      tableCHSHNumerator32 vectorIntBellTable32 =
        localHiddenVariableCHSHNumerator32 H) := by
  intro h
  cases h with
  | intro H hH =>
      have hEnvelope :
          ConvexLocalEnvelope32
            (tableCHSHNumerator32 vectorIntBellTable32) := by
        cases localHiddenVariableCHSH_in_convex_envelope32 H with
        | intro M hM =>
            exact Exists.intro M (by rw [hH]; exact hM)
      exact vectorCHSH_exceeds_convex_local_envelope32 hEnvelope

def VectorBornDynamicsReady
    (M : FiniteEntanglementOperationalModel) : Prop :=
  M.table = concreteCHSHTable /\
  M.tensorPreparation /\
  M.localMeasurementFamilies /\
  M.bornJointDistribution /\
  (forall x y,
    vectorBornWeight32 x y .plus .plus +
    vectorBornWeight32 x y .plus .minus +
    vectorBornWeight32 x y .minus .plus +
    vectorBornWeight32 x y .minus .minus = 32) /\
  (forall x y1 y2 a,
    vectorBornWeight32 x y1 a .plus +
      vectorBornWeight32 x y1 a .minus =
    vectorBornWeight32 x y2 a .plus +
      vectorBornWeight32 x y2 a .minus) /\
  (forall x1 x2 y b,
    vectorBornWeight32 x1 y .plus b +
      vectorBornWeight32 x1 y .minus b =
    vectorBornWeight32 x2 y .plus b +
      vectorBornWeight32 x2 y .minus b) /\
  tableCHSHNumerator32 vectorIntBellTable32 = 80 /\
  Not (ConvexLocalEnvelope32
    (tableCHSHNumerator32 vectorIntBellTable32)) /\
  M.stableSettingOutcomeChannels /\
  M.noOutcomeConditionedChannelChoice /\
  M.localRealizationOfJointProfile

structure VectorBornOperationalBridge
    (M : FiniteEntanglementOperationalModel) where
  tensor_preparation : M.tensorPreparation
  local_measurement_families : M.localMeasurementFamilies
  born_joint_distribution_from_vector_born : M.bornJointDistribution
  normalized_joint_weights_from_vector_born :
    (forall x y,
      vectorBornWeight32 x y .plus .plus +
      vectorBornWeight32 x y .plus .minus +
      vectorBornWeight32 x y .minus .plus +
      vectorBornWeight32 x y .minus .minus = 32) ->
    M.normalizedJointWeights
  no_signaling_marginals_from_structural_symmetry :
    (forall x y1 y2 a,
      vectorBornWeight32 x y1 a .plus +
        vectorBornWeight32 x y1 a .minus =
      vectorBornWeight32 x y2 a .plus +
        vectorBornWeight32 x y2 a .minus) ->
    (forall x1 x2 y b,
      vectorBornWeight32 x1 y .plus b +
        vectorBornWeight32 x1 y .minus b =
      vectorBornWeight32 x2 y .plus b +
        vectorBornWeight32 x2 y .minus b) ->
    M.noSignalingMarginals
  bell_witness_violation_from_convex_local_exclusion :
    tableCHSHNumerator32 vectorIntBellTable32 = 80 ->
    Not (ConvexLocalEnvelope32
      (tableCHSHNumerator32 vectorIntBellTable32)) ->
    M.bellWitnessViolation
  stable_channels_from_vector_table : M.stableSettingOutcomeChannels
  no_outcome_conditioned_channel_choice : M.noOutcomeConditionedChannelChoice
  local_realization_of_vector_joint_profile : M.localRealizationOfJointProfile

def VectorBornDynamicsReadyFromBridge
    {M : FiniteEntanglementOperationalModel}
    (B : VectorBornOperationalBridge M) :
    FiniteOperationalDynamicsReady M :=
  And.intro B.tensor_preparation <|
    And.intro B.local_measurement_families <|
      And.intro B.born_joint_distribution_from_vector_born <|
        And.intro
          (B.normalized_joint_weights_from_vector_born
            vectorBorn_table_normalized32) <|
          And.intro
            (B.no_signaling_marginals_from_structural_symmetry
              vectorBorn_no_signaling_from_structural_symmetry32
              vectorBorn_bob_no_signaling_from_structural_symmetry32) <|
            And.intro
              (B.bell_witness_violation_from_convex_local_exclusion
                vectorTableCHSH_value32
                vectorCHSH_exceeds_convex_local_envelope32) <|
              And.intro B.stable_channels_from_vector_table <|
                And.intro B.no_outcome_conditioned_channel_choice
                  B.local_realization_of_vector_joint_profile

def VectorBornBoundaryCompatibility
    {M : FiniteEntanglementOperationalModel}
    {T : BellWitnessTarget}
    (B : VectorBornOperationalBridge M)
    (D : OperationalDynamicsBridge M T) :
    BoundaryLevelCompatibility T :=
  BoundaryCompatibilityFromOperationalDynamics D
    (VectorBornDynamicsReadyFromBridge B)

def VectorBornNoSignalingEndpoint
    {M : FiniteEntanglementOperationalModel}
    {T : BellWitnessTarget}
    (B : VectorBornOperationalBridge M)
    (D : OperationalDynamicsBridge M T) :
    NoSignalingEndpoint T :=
  NoSignalingEndpointFromOperationalDynamics D
    (VectorBornDynamicsReadyFromBridge B)

def VectorBornFlagshipSpine : Prop :=
  tableCHSHNumerator32 vectorIntBellTable32 = 80 /\
  Not (ConvexLocalEnvelope32
    (tableCHSHNumerator32 vectorIntBellTable32)) /\
  (forall x y,
    vectorBornWeight32 x y .plus .plus +
    vectorBornWeight32 x y .plus .minus +
    vectorBornWeight32 x y .minus .plus +
    vectorBornWeight32 x y .minus .minus = 32) /\
  (forall x y1 y2 a,
    vectorBornWeight32 x y1 a .plus +
      vectorBornWeight32 x y1 a .minus =
    vectorBornWeight32 x y2 a .plus +
      vectorBornWeight32 x y2 a .minus) /\
  (forall x1 x2 y b,
    vectorBornWeight32 x1 y .plus b +
      vectorBornWeight32 x1 y .minus b =
    vectorBornWeight32 x2 y .plus b +
      vectorBornWeight32 x2 y .minus b)

theorem vectorBorn_flagship_spine :
    VectorBornFlagshipSpine := by
  exact And.intro vectorTableCHSH_value32 <|
    And.intro vectorCHSH_exceeds_convex_local_envelope32 <|
      And.intro vectorBorn_table_normalized32 <|
        And.intro
          vectorBorn_no_signaling_from_structural_symmetry32
          vectorBorn_bob_no_signaling_from_structural_symmetry32

def ReasonableDeepestFiniteEntanglementSpine : Prop :=
  (forall W a,
    sameOppositeTwoOutcomeWeight W a .plus +
      sameOppositeTwoOutcomeWeight W a .minus =
    W.sameWeight + W.oppositeWeight) /\
  (forall W b,
    sameOppositeTwoOutcomeWeight W .plus b +
      sameOppositeTwoOutcomeWeight W .minus b =
    W.sameWeight + W.oppositeWeight) /\
  (forall x y a b,
    interfaceBornWeight32
        concreteFiniteVectorGeometryInterface x y a b =
      vectorBornWeight32 x y a b) /\
  (forall n,
    ConvexLocalEnvelope32 n ->
      GeneralConvexLocalEnvelope 32 n) /\
  Not (exists H : Denominator32LocalHiddenVariableModel,
    tableCHSHNumerator32 vectorIntBellTable32 =
      localHiddenVariableCHSHNumerator32 H) /\
  (forall {M : FiniteEntanglementOperationalModel}
      {T : BellWitnessTarget}
      (_ : VectorBornOperationalBridge M)
      (_ : OperationalDynamicsBridge M T),
    BoundaryLevelCompatibility T /\ NoSignalingEndpoint T)

theorem reasonableDeepestFiniteEntanglement_spine :
    ReasonableDeepestFiniteEntanglementSpine := by
  exact And.intro sameOpposite_alice_marginal <|
    And.intro sameOpposite_bob_marginal <|
      And.intro concreteInterfaceBornWeight_matches_vectorBorn32 <|
        And.intro
          (fun _ h => denominator32Envelope_embeds_general h) <|
          And.intro vectorBorn_not_denominator32_local_hidden_variable32 <|
            fun B D =>
              And.intro
                (VectorBornBoundaryCompatibility B D)
                (VectorBornNoSignalingEndpoint B D)

end QuantumEntanglementBoundaryCompatibility
end Papers
end MaleyLean
