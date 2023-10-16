#include "nw_i0_generic"
#include "help_general"

void StartCombat(object oPC)
{
    SetPlotFlag(OBJECT_SELF, FALSE);

    DetermineCombatRound(oPC);
}

void CreateSakaraAlly(location lWP, object oPC)
{
    if (GetLocalInt(OBJECT_SELF, "N_MED_DEST") == 0)
    {
        string sResRef = "CT_COMM_HS_DARK";

        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), lWP);

        object o = CreateObject(OBJECT_TYPE_CREATURE, sResRef, lWP);

        AssignCommand(o, DetermineCombatRound(oPC));
    }
}

void main()
{
    int NUMB_OF_HENCH = 2;

    object oPC = GetPCSpeaker();

    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);

    object oWP;

    location lWP;

    int i;

    for (i = 1; i <= NUMB_OF_HENCH; i++)
    {
        oWP = GetNearestObjectByTag("WP_HENCH_SAKARA", OBJECT_SELF, i);

        lWP = GetLocation(oWP);

        CreateSakaraAlly(lWP, oPC);
    }

    DelayCommand(1.0, StartCombat(oPC));

}
