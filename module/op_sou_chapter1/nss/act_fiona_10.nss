//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Fiona gives helm to PC and marks as done.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 21, 2003
//:://////////////////////////////////////////////
void CreateSword(object oPC);
void main()
{
    object oPC = GetPCSpeaker();
    //ActionPauseConversation();
    //set local to sword given
    SetLocalInt(oPC,"X1_FIONAHELM",99);
    SetLocalInt(oPC, "X1_nSmithHelmWait", 3);
    CreateSword(oPC);

}

void CreateSword(object oPC)
{
    int nAmount = GetLocalInt(OBJECT_SELF, "nHelmPrice");
    TakeGoldFromCreature(nAmount, oPC);
    CreateItemOnObject("q1shadowhelm",oPC);
}
