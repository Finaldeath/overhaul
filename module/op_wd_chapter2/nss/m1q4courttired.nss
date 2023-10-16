//::///////////////////////////////////////////////
//:: Conversation
//:: m1q4CourtTired
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC stays for the night.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 2, 2001
//:://////////////////////////////////////////////

void main()
{
	SetLocalInt(OBJECT_SELF,"NW_L_Tired",10);
    SetLocalObject(OBJECT_SELF,"NW_L_Companion",GetPCSpeaker());
}
