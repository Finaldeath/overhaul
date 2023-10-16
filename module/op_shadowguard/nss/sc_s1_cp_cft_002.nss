void main()
{
    object oPC = GetPCSpeaker();

    // Cast for cutscene
    object oCP = GetNearestObjectByTag("CT_UNIQ_NT_CRIM");
    object oHarkon = GetNearestObjectByTag("CT_UNIQ_SH_HARK");
    object oMarkius = GetNearestObjectByTag("HENCH_MARK");
    object oLyen = GetNearestObjectByTag("HENCH_LYEN");
    object oKara = GetNearestObjectByTag("HENCH_KARA");
    object oBrukus = GetNearestObjectByTag("HENCH_BRUK");
    object oTarin = GetNearestObjectByTag("HENCH_TARI");

    // EXTRA CODE BELOW
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GLOBE_INVULNERABILITY), oCP, 3.0);
}
