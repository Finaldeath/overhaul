#include "nw_i0_generic"

void main()
{
    object oDesk = GetNearestObjectByTag("PLAC_VARH_DESK");
    SetPlotFlag(oDesk, FALSE);
    SetPlotFlag(OBJECT_SELF, FALSE);

    location lVarhun = GetLocation(OBJECT_SELF);
    object oQuas = CreateObject(OBJECT_TYPE_CREATURE, "CT_UNIQ_VH_QUAS", lVarhun);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SILENCE), OBJECT_SELF);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oQuas));

    ChangeToStandardFaction(oQuas, STANDARD_FACTION_HOSTILE);

    int iNth = 1;
    object oDoor = GetNearestObjectByTag("DOOR_VARH_CHAMB", OBJECT_SELF, iNth);
    while (oDoor != OBJECT_INVALID)
    {
        AssignCommand(oDoor, ActionCloseDoor(oDoor));
        SetLocked(oDoor, TRUE);

        iNth++;
        oDoor = GetNearestObjectByTag("DOOR_VARH_CHAMB", OBJECT_SELF, iNth);
    }

    object oPC = GetPCSpeaker();
    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
    DetermineCombatRound(oPC);

    object oAnag = GetNearestObjectByTag("CT_UNIQ_SH_ANAG");
    if (GetDistanceBetween(oAnag, OBJECT_SELF) < 10.0)
    {
        object oVarhun = OBJECT_SELF;
        AssignCommand(oAnag, DetermineCombatRound(oVarhun));
    }
}
