//::///////////////////////////////////////////////
//:: Name q2d_end_brit
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
    if (GetTag(GetArea(OBJECT_SELF)) == "q2d_undermountainlevel3"  && GetIsObjectValid(GetPCSpeaker())  & GetLocalInt(GetPCSpeaker(), "nTalkedBritOnce") == 1)
    {
        AssignCommand(OBJECT_SELF, ActionMoveToObject(GetWaypointByTag("wp_level3_brit"), TRUE));
        AssignCommand(OBJECT_SELF, ActionJumpToObject(GetWaypointByTag("wp_yp_q2dbrit")));
    }
}
