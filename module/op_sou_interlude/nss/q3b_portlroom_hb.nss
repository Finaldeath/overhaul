// Ruins HB event: checks to see if all confitions for bringing Drogan are valid:
// 1. The player is not in combat
// 2. The player is near the portal (inside a trigger)

void BringDrogan(object oPC);

void main()
{
    object oDrogan = GetObjectByTag("Q3B_DROGAN");
    //if (GetLocalInt(GetModule(), "Q3B_HUERODIS_LEFT_THE_BUILDING") == 0)
    //    return;
    if(oDrogan != OBJECT_INVALID) // he is already here...
        return;
    object oSlaad = GetObjectByTag("NW_SLAADGRAY");
    if(oSlaad != OBJECT_INVALID) // still alive
        return;
    // Dorgan has not arrived yet.
    // Pass over all players, and if inside AND not in combat then bring Drogan
    object oPC = GetFirstPC();
    while(oPC != OBJECT_INVALID)
    {
        int nInside = GetLocalInt(oPC, "Q3B_INSIDE_PORTAL_ROOM");
        if(nInside == 1 && !GetIsInCombat(oPC)) // all conditions are met
        {
            BringDrogan(oPC);
            return;
        }
        oPC = GetNextPC();
    }
}

void BringDrogan(object oPC)
{
    SetLocalInt(GetModule(), "X1_DROGAN_BACK", 1); // used in Garrick's dialog
    AssignCommand(oPC, ClearAllActions());
    effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
    object oDrogan = CreateObject(OBJECT_TYPE_CREATURE, "drogan", GetLocation(oPC));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oDrogan));
    DelayCommand(2.0, AssignCommand(oDrogan, ActionStartConversation(oPC)));

    // and also - unsummon myrmarch
    object oMyrmarch = GetLocalObject(GetArea(OBJECT_SELF), "Q3B_MYRMARCH");
    if(oMyrmarch == OBJECT_INVALID)
        return;
    eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oMyrmarch);
    DestroyObject(oMyrmarch);
}
