//::///////////////////////////////////////////////
//:: Name q2bn_att_drowpat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When attacked - the drow patrol will return
    to his base
    wp_q2bn_drowpost
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 18/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDoneOnce") == 1)
        return;
    SetLocalInt(OBJECT_SELF, "nDoneOnce", 1);
    object oTarget = GetWaypointByTag("wp_q2bn_drowpost");
    ClearAllActions(TRUE);
    SpeakStringByStrRef(84074, TALKVOLUME_SHOUT);
    ActionMoveToObject(oTarget, TRUE);
    object oFacer = GetWaypointByTag("wp_q2bn_drowpatrol1");
    DelayCommand(10.0, SetFacingPoint(GetPosition(oFacer)));
    DelayCommand(11.5, DetermineCombatRound());
}
