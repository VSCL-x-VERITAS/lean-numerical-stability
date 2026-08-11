import NumStability.HDP.Process.VC

/-- Stable source alias for `HDP-08-EX-8.3.15`. -/
theorem NumStability.HDP.Contract.hdp_08_hex_h8_d3_d15 (n d : ℕ) :
    Nat.card
        {f : Fin n → Bool //
          f ∈ NumStability.HDP.Process.VC.hammingBallClass n d} =
      Nat.card
        {A : Finset (Fin n) //
          NumStability.HDP.Process.VC.Shatters
            (NumStability.HDP.Process.VC.hammingBallClass n d) A} :=
  NumStability.HDP.Process.VC.pajorSharpness_hammingBall n d
