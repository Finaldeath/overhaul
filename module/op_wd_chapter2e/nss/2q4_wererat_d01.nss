//::///////////////////////////////////////////////
//:: Wererat Change
//:: 2Q4_Wererat_D01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Changes someone into a wererat when they are
    attacked and sets local on Gregor.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 27, 2002
//:://////////////////////////////////////////////
#include "nw_i0_2q4luskan"'
#include "nw_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();
    int nChange = GetLocalInt(OBJECT_SELF,"M2Q4_WERERAT_CHANGE");
    effect eShape = EffectPolymorph(POLYMORPH_TYPE_WERERAT);
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);

    if(nUser == 1001)
    {
        if(GetIsFighting(OBJECT_SELF))
        {
            if(d100() > 75)
            {
                SpeakOneLinerConversation("2q4_fighting");
            }
        }
    }
    if(nUser = 1005 && nChange == 0)
    {
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eShape, OBJECT_SELF));
        DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF)));
        SetLocalInt(OBJECT_SELF, "M2Q4_WERERAT_CHANGE", 1);
    }
    else if(nUser == 1006)
    {
        object oPC = GetLastDamager();
        if(GetIsPC(oPC) && GetIsObjectValid(oPC))
        {
            object oGregor = GetNearestObjectByTag("2Q4_GateGuard");
            if(GetIsObjectValid(oGregor))
            {
                SetLocalInt(oGregor,"Helped_Gregor", 1);
            }
        }
    }
}
