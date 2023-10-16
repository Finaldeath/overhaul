//::///////////////////////////////////////////////
//:: Name act_q2aherald_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Herald Joins the PC as a follower
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "x0_i0_henchman"
void main()
{
    object oPC = GetPCSpeaker();

    //Imloth won't be following the PC - just the wisp
    if (GetTag(OBJECT_SELF) != "q2arebimloth")
    {
        //Set the PC as the one to be followed.
        SetLocalObject(OBJECT_SELF, "oLeader", oPC);

        //Variable for conversation nodes
        SetLocalInt(OBJECT_SELF, "nSpokeOnce", GetLocalInt(OBJECT_SELF, "nSpokeOnce") + 1);

        //Signal herald to start following the PC
        SignalEvent(OBJECT_SELF, EventUserDefined(101));

        //Variable for abort script of conversation
        SetLocalInt(GetModule(), "X2_Q2AHeraldSpeak", 1);
    }
    //expose the map for the PC
    object oArea = GetArea(OBJECT_SELF);
    ExploreAreaForPlayer(oArea, oPC);

    //Remove the immobalize effect from the PC (from the Valsharess dream)
    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE)
            RemoveEffect(oPC, eEffect);
        eEffect = GetNextEffect(oPC);
    }
}
