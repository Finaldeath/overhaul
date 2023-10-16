#include "NW_I0_GENERIC"

//::///////////////////////////////////////////////
//:: os_al_cutconvend
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ends the cutscene if the dialog exits normally
    on Alias's vote check
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: April 2004
//:://////////////////////////////////////////////
void RemoveAOEs(object oTarget);

void main()
{
    object oPCSpeaker = GetPCSpeaker();
    object oSelf = OBJECT_SELF;

    SetLocalInt(oSelf, "flg_cutclosing", FALSE);
    SetLocalInt(oSelf, "flg_cutrunning", FALSE);
    RemoveAOEs(oSelf);

    SetCutsceneMode(oPCSpeaker, FALSE);

    WalkWayPoints();
}

// remove the fear area of effect
void RemoveAOEs(object oTarget)
{
    effect eCursor = GetFirstEffect(oTarget);

    while (GetIsEffectValid(eCursor) == TRUE)
    {
        if (GetEffectType(eCursor) == EFFECT_TYPE_AREA_OF_EFFECT)
        {
            RemoveEffect(oTarget, eCursor);
        }
        eCursor = GetNextEffect(oTarget);
    }
}
