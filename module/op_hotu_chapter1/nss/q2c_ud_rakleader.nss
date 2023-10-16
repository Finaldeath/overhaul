//::///////////////////////////////////////////////
//:: Name q2c_ud_rakleader
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On signal, all Rakshasa in the area transform
    from their slave selves to their Rakshasa selves
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 4/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if (nUser == 101)
    {
        //prevent recursion
        if (GetLocalInt(GetModule(), "X2_RakTransformed") == 1)
            return;

        SetLocalInt(GetModule(), "X2_RakTransformed", 1);
        ClearAllActions(TRUE);

        location lLoc = GetLocation(OBJECT_SELF);
        //Apply a transformation effect
        effect eTransform1 = EffectVisualEffect(VFX_DUR_PIXIEDUST);
        effect eTransform2 = EffectVisualEffect(VFX_IMP_DISPEL);
        effect eTransform3 = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
        effect eTransform4 = EffectVisualEffect(471);
        effect eLink1 = EffectLinkEffects(eTransform1, eTransform2);
        effect eLink2 = EffectLinkEffects(eTransform3, eTransform4);
        effect eLink = EffectLinkEffects(eLink1, eLink2);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lLoc);
        object oRak = CreateObject(OBJECT_TYPE_CREATURE, "q2crakshareesh", lLoc);
        AssignCommand(oRak, DetermineCombatRound());
        DestroyObject(OBJECT_SELF, 0.25);

    }
    else if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {
        object oArea = GetArea(OBJECT_SELF);
        ExecuteScript("act_q2rakattack", oArea);
    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if(nUser == NW_FLAG_SPELL_CAST_AT_EVENT) // SPELL CAST AT
    {
        int nSpell = GetLastSpell();
        if (GetLastSpellHarmful() == TRUE || nSpell == SPELL_TRUE_SEEING)
        {
            object oArea = GetArea(OBJECT_SELF);
            ExecuteScript("act_q2rakattack", oArea);
        }

    }

}


