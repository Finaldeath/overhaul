//::///////////////////////////////////////////////
//:: Name: x1_onload
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On load of the module, initialize any variables
    that need to be set.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 20/03
//:://////////////////////////////////////////////

void main()
{
    //Assign a PC Number to each entering PC so that we know
    //who player 1 is - and who gets jumped to the extra room
   //SetLocalInt(OBJECT_SELF, "nPCNumber", 1);
    SetLocalString(OBJECT_SELF,"NW_S_VERSION", "2.15");
}
