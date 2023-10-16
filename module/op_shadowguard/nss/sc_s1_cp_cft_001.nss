#include "help_hench"

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
    AddJournalSingle("JT_ST_1_MAIN", 16, oPC);

    effect e = EffectVisualEffect(VFX_IMP_DEATH);

    AssignCommand(oHarkon, ApplyEffectToObject(DURATION_TYPE_INSTANT, e, oCP));
}
