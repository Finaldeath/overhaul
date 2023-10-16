//::///////////////////////////////////////////////
//:: M3Q3C_HASAMULET
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Attack Nearest PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: May 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    object oPC = GetEnteringObject();
    if(GetLocalInt(GetModule(),"NW_G_M3Q3CA_AMULET")==0
        && GetIsObjectValid(GetItemPossessedBy(oPC,"M3Q3C_SWORDAGES")))
    {
        SetLocalInt(GetModule(),"NW_G_M3Q3CA_AMULET",1);
        object oDragon = GetNearestObjectByTag("M3Q3C_GUARDIAN");
        location lDragon = GetLocation(oDragon);
        AssignCommand(oDragon,SpeakOneLinerConversation());
//        AssignCommand(oDragon,ActionSpeakStringByStrRef(46855));
        AdjustReputation(oPC,oDragon,-100);
        AssignCommand(oDragon,DetermineCombatRound(oPC));
        effect eFire=EffectVisualEffect(VFX_FNF_FIRESTORM);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eFire,lDragon);
        effect eDam = EffectDamage(100);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oDragon);
        effect eAC = EffectACDecrease(17,AC_NATURAL_BONUS);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAC, oDragon);
    }
}
