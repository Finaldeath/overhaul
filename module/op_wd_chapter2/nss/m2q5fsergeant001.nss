//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q5FSERGEANT001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Luskan sergeant gives a warning to any
    low level PCs before letting them into Luskan.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 3, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"M2Q5F_Warned",1);
}
