//::///////////////////////////////////////////////
//:: City of Lost Souls Rebus Puzzle, Elysium (Condition Script)
//:: H2c_Rebus_Elysi.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if this is the "Elysium" post.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 30, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    //Identify myself by way of the corresponding map note's name
    object oMapNote = GetNearestObjectByTag("H2_Rebus_MapNote");
    string sName = GetName(oMapNote);

    if (sName == "h2_rebus_elysi")
    {
        return TRUE;
    }
    return FALSE;
}

