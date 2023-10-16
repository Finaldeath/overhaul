// Sentence Yakir the black and set the plot state to four

#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "N_ST_0_SPIRIT_OFFERING", 3);

    AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 5);

    object oSpirit = GetNearestObjectByTag("CT_UNIQ_NT_S0WR", oPC);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_IMPLOSION), GetLocation(oSpirit));

    AddJournalSingle("JT_GRAD_CEREMONY", 3, GetPCSpeaker());
    DestroyObject(oSpirit, 2.0);
}
