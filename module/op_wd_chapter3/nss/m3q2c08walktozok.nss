//::///////////////////////////////////////////////
//:: Walks to Zokan
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "M3PLOTINCLUDE"

void main()
{
//SpeakString("test");
    ActionPauseConversation();
    SetLocked(GetQ2D08FortDoor(), FALSE);
    SetElkTribePeaceful(GetPCSpeaker());
    ActionResumeConversation();
    AssignCommand(GetQ2D08FortDoor(), ActionOpenDoor(OBJECT_SELF));
/*    if (GetIsObjectValid(GetZokanPlace()) == FALSE)
    {
        SpeakString("UT: No Valid Object");
    }*/
    ActionMoveToObject(GetZokanPlace(), FALSE);
}
