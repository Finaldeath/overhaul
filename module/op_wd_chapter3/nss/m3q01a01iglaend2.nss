//::///////////////////////////////////////////////
//:: Trial Is Over
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Trial ends whenever conversation ends
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://///////////////////////////////////////////


void main()
{
    object oPC = GetPCSpeaker();
    object oBook = GetItemPossessedBy(oPC,"M3Q1TrialBook");
    DestroyObject(oBook);

        ExecuteScript("M3Q1ClearTrial",OBJECT_SELF);
}
