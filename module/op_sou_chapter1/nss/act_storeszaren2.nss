//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Take the dragon egg and give the pc the cloak.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 31, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oEggs = GetLocalObject(OBJECT_SELF,"DRAGONEGGS");
    CreateItemOnObject("q1szarencloak",oPC);
    DestroyObject(oEggs);
}
