//::///////////////////////////////////////////////
//:: Name q2b_end_tethlan
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    After he finishes conversing with the PC,
    Tethlan will walk to the exit to the Inn and
    destroy himself. (go back to the inn).
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: Nov 12/02
//:://////////////////////////////////////////////

void main()
{
    if (GetTag(GetArea(OBJECT_SELF)) == "q2b_undermountainlevel1"  && GetIsObjectValid(GetPCSpeaker())  & GetLocalInt(GetPCSpeaker(), "nTalkedTethlanOnce") == 1)
    {
        SetPlotFlag(OBJECT_SELF, TRUE);
        AssignCommand(OBJECT_SELF, ActionMoveToObject(GetWaypointByTag("wp_level1_tethlan"), TRUE));
        AssignCommand(OBJECT_SELF, ActionJumpToObject(GetWaypointByTag("wp_yp_q2btethlan")));
    }
}
