//::///////////////////////////////////////////////
//:: M41C07_LEVER.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Pulling this starts the Simon says puzzle and
    locks the player in.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(),"NW_G_M41C07_LEVER_PUZZLE") == 0)
    {
        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        SetLocalInt(GetModule(),"NW_G_M41C07_LEVER_PUZZLE",10);
        AssignCommand(GetNearestObjectByTag("M4Q1C07_DOOR"), ActionCloseDoor(OBJECT_SELF));
        SetLocked(GetNearestObjectByTag("M4Q1C07_DOOR"), TRUE);
        AssignCommand(GetNearestObjectByTag("M4Q1C07_MACH"), SpeakOneLinerConversation());
    }
}
