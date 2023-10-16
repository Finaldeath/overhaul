//::///////////////////////////////////////////////
//:: Name hx_mimic_ai
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This is the default behavior that the mimic
     will follow. The general idea is that it will
     continue jumping around the level. It will
     try to avoid the PC and will scramble if it
     gets too close. It will also search out any
     "gem" that has been dropped. The gems will be
     used for the end puzzle to defeat the mimic.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 28, 2003
//:://////////////////////////////////////////////
#include "mimic_inc"
// Debug.
void RemoveGlow();

void main()
{
    object oTarget;
    effect eEffect = GetFirstEffect(OBJECT_SELF);

    // Only react if AI is on.
    if(GetMimicAI(OBJECT_SELF) == 1)
    {
        oTarget = GetTargetObject(OBJECT_SELF);

        //////////
        //Debug
        //
        //RemoveGlow();
        //
        //int iTarget = GetLocalInt(OBJECT_SELF, "MimicTarget");
        //AssignCommand(GetModule(), ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_ETHEREAL_VISAGE), oTarget));
        //
        //SpeakString("My Target is " + GetName(oTarget) + " - TYPE " + IntToString(iTarget));
        //
        // Clean off any effects.
        //while(GetIsEffectValid(eEffect))
        //{
        //    if(GetEffectCreator(eEffect) == OBJECT_SELF)
        //        RemoveEffect(OBJECT_SELF, eEffect);
        //    eEffect = GetNextEffect(OBJECT_SELF);
        //}
        //////////

        if(GetIsObjectValid(oTarget))
        {
            PathfindToObject(OBJECT_SELF, oTarget);
        }
        else
        {
            DoRandomMimicAI(OBJECT_SELF);
        }
    }
    else
    {
        DoRandomMimicAI(OBJECT_SELF);
    }
}

// Used for debug.
void RemoveGlow()
{
    object oChain = GetNearestObjectByTag("grapple_target");
    effect eEffect;
    int x = 1;

    while(GetIsObjectValid(oChain))
    {
        eEffect = GetFirstEffect(oChain);
        while(GetIsEffectValid(eEffect))
        {
            if(GetEffectCreator(eEffect) == GetModule())
            {
                RemoveEffect(oChain, eEffect);
            }
            eEffect = GetNextEffect(oChain);
        }
        x = x + 1;
        oChain = GetNearestObjectByTag("grapple_target", OBJECT_SELF, x);
    }
}
