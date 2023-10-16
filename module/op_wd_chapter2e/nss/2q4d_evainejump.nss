//::///////////////////////////////////////////////
//:: Evaine Jump
//:: 2Q4D_EvaineJump
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When Evaine enters the trigger she will jump
    to her brother, or if he is dead destroy herself
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 19, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"
void main()
{
    object oEnter = GetEnteringObject();
    if(GetTag(oEnter) == "M2Q05CEVAINE")
    {
        object oBrother = GetObjectByTag("2Q4A01_Elynwyd");
        effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oEnter);
        if(GetIsObjectValid(oBrother))
        {
            ClearAllActions();
            AssignCommand(oEnter, JumpToObject(oBrother, FALSE));
        }
        else
        {
            DestroyObject(oEnter, 1.0);
        }
    }
}
