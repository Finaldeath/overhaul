// * If attacked by Intellect Devourer, become possessed

//::///////////////////////////////////////////////
//:: Default On Attacked
//:: NW_C2_DEFAULT5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    object oDevourer = GetObjectByTag("M1Q2_DEVOUR");
    if(GetLastAttacker() == oDevourer)
    {
        SetLocalInt(OBJECT_SELF,"M1Q02BloodSailorTransformed",1);
        effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
        ClearAllActions();
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis,OBJECT_SELF);
        ChangeFaction(OBJECT_SELF,oDevourer);
        SpeakString("NW_CALL_TO_ARMS",TALKVOLUME_SILENT_SHOUT);
        DestroyObject(oDevourer);
    }
}

