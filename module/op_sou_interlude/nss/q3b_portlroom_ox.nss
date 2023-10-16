// portal room exit event
// flag player as not in the room (needed in the trigger's HB event)

#include "nw_i0_plot"

void BringDrogan(object oPC);

void main()
{
    object oPC = GetExitingObject();
    if(!GetIsPlayerCharacter(oPC))
        return;
    // flag pc as inside
    SetLocalInt(oPC, "Q3B_INSIDE_PORTAL_ROOM", 0);

    object oDrogan = GetObjectByTag("Q3B_DROGAN");
    //if (GetLocalInt(GetModule(), "Q3B_HUERODIS_LEFT_THE_BUILDING") == 0)
    //    return;
    if(oDrogan != OBJECT_INVALID) // he is already here...
        return;
    object oSlaad = GetObjectByTag("NW_SLAADGRAY");
    if(oSlaad != OBJECT_INVALID) // still alive
        return;

    if(!GetIsInCombat(oPC)) // all conditions are met
    {
        BringDrogan(oPC);
        return;
    }
}

void BringDrogan(object oPC)
{
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
