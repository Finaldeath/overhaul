//::///////////////////////////////////////////////
//:: KraegenExit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: June 14, 2002
//:://////////////////////////////////////////////

void main()
{
    object oExited = GetExitingObject();
    object oKraegenPost = GetObjectByTag("WP_Kraegen");

    if (GetTag(oExited) == "Kraegen")
    {
        AssignCommand(oExited,ClearAllActions());
        AssignCommand(oExited,ActionMoveToObject(oKraegenPost));
    }
}
