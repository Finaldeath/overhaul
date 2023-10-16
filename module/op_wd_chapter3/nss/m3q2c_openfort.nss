//::///////////////////////////////////////////////
//:: Opens door to Elk Tribe Fort
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    M3Q2C_OPENFORT
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 2002
//:://////////////////////////////////////////////
#include "M3PLOTINCLUDE"

void main()
{
//SpeakString("test");
    ActionPauseConversation();
    SetLocked(GetQ2D08FortDoor(), FALSE);
    SetElkTribePeaceful(GetPCSpeaker());
//    ActionOpenDoor(GetQ2D08FortDoor());
    AssignCommand(GetQ2D08FortDoor(),ActionOpenDoor(OBJECT_SELF));
    ActionResumeConversation();
}
